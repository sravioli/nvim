---functions to handle keymaps
---
---@class Fun.keymaps
local M = {}

---@package
---Sets the all the keymaps present in the given table.
---
---This function should not be used directly.
---
---`values` should follow the following format:
---
---```lua
------example file `mappings/<plugin-name>.lua`
------@class Mappings
---return {
---  ---load on neovim startup. for plugins it is recommended to set it to `false` and
---  ---load the keymaps right after calling the plugin setup()
---  autoload = true,
---
---  n = {
---    ["<lhs>"] = { "<rhs>", "<description>", opts = { ... } },
---    -- ...
---  },
---
---  v = {
---    ["<lhs>"] = { "<rhs>", "<description>" },
---    -- ...
---  },
---
---  ---other mappings for other vim modes
---  -- ...
---}
---```
---
---`options` should be a table of `MappingSpecOpts`.
---
---This function uses `vim.keymap.set` under the hood.
---
---@param values Mappings The table of keymaps that have to be set.
---@param options? MappingSpecOpts A table of mapping options.
---
---@see MappingSpecOpts for more information about the `options` parameter
---@see Fun.keymaps.load for more information on how to load plugin keymaps.
---@see vim.keymap.set for more information on how to set keymaps.
M.__set_keymap = function(values, options)
  ---check if the keymaps have to be loaded automatically
  if values.autoload == false then
    return -- Skip setting keymaps if autoload is false
  end
  values.autoload = nil

  ---@param mode string
  ---@param mapping table<lhs, MappingSpec>
  for mode, mapping in pairs(values) do
    local default_options = vim.tbl_deep_extend("force", { mode = mode }, options or {})

    for lhs, mappings_spec in pairs(mapping) do
      ---merge global options with single keymap options
      local opts = vim.tbl_deep_extend("force", default_options, mappings_spec.opts or {})

      mappings_spec.opts, opts.mode = nil, nil
      opts.desc = mappings_spec[2] ---set keymap description

      vim.keymap.set(mode, lhs, mappings_spec[1], opts)
    end
  end
end

---Loads the keymaps for the corresponding plugin
---
---@param plugin? nil|string|table Name of the mappings or a table of mappings.
---@param options? MappingSpecOpts A table of options that will be passed to `vim.keymap.set`
M.load = function(plugin, options)
  vim.schedule(function()
    local ptype = type(plugin)
    local __set_keymap = M.__set_keymap

    if ptype == "nil" then
      local keymaps = require "srv.mappings" ---@class Keymaps
      for _, pmappings in pairs(keymaps) do
        __set_keymap(pmappings, options)
      end
    elseif ptype == "string" then
      local exists_mappings, mappings = pcall(require, ("srv.mappings.%s"):format(plugin))
      if not exists_mappings then
        vim.notify(("No keymaps found for plugin '%s'! check your config"):format(plugin))
        return
      end

      if type(mappings) == "function" then
        mappings = mappings()
      end

      mappings.autoload = true
      __set_keymap(mappings, options)
    elseif ptype == "table" then
      __set_keymap(plugin, options)
    elseif ptype == "function" then
      __set_keymap(plugin(), options)
    else
      vim.notify(("got unexpected value (%s) for plugin, expected one of"):format(ptype))
    end
  end)
end

--~ {{{1 MappingsSpec

---Mapping options accepted by MappingSpec.opts
---@class MappingSpecOpts
---
---When defining a buffer-local mapping for "," there may be a global mapping
---that starts with ",".  Then you need to type another character for Vim to know
---whether to use the "," mapping or the longer one.  To avoid this add the
---`<nowait>` argument.  Then the mapping will be used when it matches, Vim does
---not wait for more characters to be typed.  However, if the characters were
---already typed they are used.
---Note that this works when the `<nowait>` mapping fully matches and is found
---before any partial matches.  This works when:
---- There is only one matching buffer-local mapping, since these are always
---  found before global mappings.
---- There is another buffer-local mapping that partly matches, but it is
---  defined earlier (last defined mapping is found first).
---@field nowait? true|false
---
---Defines a mapping which will not be echoed on the command line.
---Messages from the executed command are still given though.  To shut them up
---too, add a ":silent" in the executed command:
---
---```vim
---:map <silent> ,h :exe ":silent normal /Header\r"<CR>
---```
--
---Note that the effect of a command might also be silenced, e.g., when the
---mapping selects another entry for command line completion it won't be
---displayed.
---Prompts will still be given, e.g., for inputdialog().
---Using "<silent>" for an abbreviation is possible, but will cause redrawing of
---the command line to fail.
---@field silent? true|false
---
---If the first argument to one of these commands is `<script>` and it is used to
---define a new mapping or abbreviation, the mapping will only remap characters
---in the {rhs} using mappings that were defined local to a script, starting with
---`<SID>`.  This can be used to avoid that mappings from outside a script
---interfere (e.g., when CTRL-V is remapped in mswin.vim), but do use other
---mappings defined in the script.
---Note: `:map <script>` and `:noremap <script>` do the same thing.  The
---`<script>` overrules the command name.  Using `:noremap <script>` is
---preferred, because it's clearer that remapping is (mostly) disabled.
---@field script? true|false
---
---If the first argument to one of these commands is `<expr>` and it is used to
---define a new mapping or abbreviation, the argument is an expression.  The
---expression is evaluated to obtain the {rhs} that is used.  Example:
---
---```vim
---:inoremap <expr> . <SID>InsertDot()
---```
---
---The result of the `s:InsertDot()` function will be inserted.  It could check the
---text before the cursor and start omni completion when some condition is met.
---Using a script-local function is preferred, to avoid polluting the global
---namespace.  Use `<SID>` in the RHS so that the script that the mapping was
---defined in can be found.
---
---For abbreviations `v:char` is set to the character that was typed to trigger
---the abbreviation.  You can use this to decide how to expand the {lhs}.  You
---should not either insert or change the `v:char`.
---
---In case you want the mapping to not do anything, you can have the expression
---evaluate to an empty string.  If something changed that requires Vim to
---go through the main loop (e.g. to update the display), return `\<Ignore>`.
---This is similar to "nothing" but makes Vim return from the loop that waits for
---input.
---
---Keep in mind that the expression may be evaluated when looking for
---typeahead, before the previous command has been executed.  For example:
---
---```vim
---func StoreColumn()
---  let g:column = col('.')
---  return 'x'
---endfunc
---nnoremap <expr> x StoreColumn()
---nmap ! f!x
---```
---
---You will notice that `g:column` has the value from before executing "f!",
---because "x" is evaluated before "f!" is executed.
---This can be solved by inserting `<Ignore>` before the character that is
---expression-mapped:
---
---```vim
---nmap ! f!<Ignore>x
---```
---
---Be very careful about side effects!  The expression is evaluated while
---obtaining characters, you may very well make the command dysfunctional.
---Therefore the following is blocked for `<expr>` mappings:
---- Changing the buffer text |textlock|.
---- Editing another buffer.
---- The |:normal| command.
---- Moving the cursor is allowed, but it is restored afterwards.
---- If the cmdline is changed, the old text and cursor position are restored.
---If you want the mapping to do any of these let the returned characters do
---that. (Or use a |<Cmd>| mapping instead.)
---
---You can use getchar(), it consumes typeahead if there is any. E.g., if you
---have these mappings:
---
---```vim
---inoremap <expr> <C-L> nr2char(getchar())
---inoremap <expr> <C-L>x "foo"
---```
---
---If you now type CTRL-L nothing happens yet, Vim needs the next character to
---decide what mapping to use.  If you type 'x' the second mapping is used and
---"foo" is inserted.  If you type any other key the first mapping is used,
---getchar() gets the typed key and returns it.
---
---Here is an example that inserts a list number that increases:
---
---```vim
---let counter = 0
---inoremap <expr> <C-L> ListItem()
---inoremap <expr> <C-R> ListReset()
---
---func ListItem()
---  let g:counter += 1
---  return g:counter .. '. '
---endfunc
---
---func ListReset()
---  let g:counter = 0
---  return ''
---endfunc
---```
---
---`CTRL-L` inserts the next number, `CTRL-R` resets the count.  `CTRL-R` returns
---an empty string, so that nothing is inserted.
---
---Note that using `0x80` as a single byte before other text does not work, it will
---be seen as a special key.
---@field expr? true|false
---
---If the first argument to one of these commands is "<unique>" and it is used to
---define a new mapping or abbreviation, the command will fail if the mapping or
---abbreviation already exists.  Example:
---
---```vim
---:map <unique> ,w  /[#&!]<CR>
---```
---
---When defining a local mapping, there will also be a check if a global map
---already exists which is equal.
---Example of what will fail:
---
---```vim
---:map ,w  /[#&!]<CR>
---:map <buffer> <unique> ,w  /[.,;]<CR>
---```
---
---If you want to map a key and then have it do what it was originally mapped to,
---have a look at |maparg()|.
---@field unique? true|false
---@field noremap? true|false non-recursive mapping (`:noremap`)
---@field desc? string human-readable description
---@field callback? function lua function called when the mapping is executed
---
---When "expr" is true, replace keycodes in the resulting string (see
---`nvim_replace_termcodes()`). Returning nil from the Lua "callback" is equivalent
---to returning an empty string.
---@field replace_keycodes? true|false
---
---
---Specification for declaring keymaps
---@class MappingSpec
---@field[1] string|function Right hand side of the mapping.
---@field[2] string Description of the mapping.
---@field opts? MappingSpecOpts Additional options for the mapping.
---
---
---Left hand side of the mapping. It should be a valid neovim keymap
---@alias lhs string
---
---
---Schema for keymaps.
---@class Mappings
---@field autoload true|false Whether the mappings should be loaded on startup.
---@field n table<lhs, MappingSpec> Mappings for normal mode.
---@field v table<lhs, MappingSpec> Mappings for visual mode.
---@field s table<lhs, MappingSpec> Mappings for Select mode.
---@field x table<lhs, MappingSpec> Mappings for visual block mode.
---@field o table<lhs, MappingSpec> Mappings for operator-pending mode.
---@field i table<lhs, MappingSpec> Mappings for insert mode.
---@field c table<lhs, MappingSpec> Mappings for command-line mode.
---@field t table<lhs, MappingSpec> Mappings for terminal mode.
---@field r table<lhs, MappingSpec> Mappings for replace mode.

--~ }}}

return M

