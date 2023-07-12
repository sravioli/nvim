---@module "srv.utils.fn"
local fn = require "srv.utils.fn"

---@type table
---Mimic the vimscript `set <option>=<value>`
---A special interface `vim.opt` exists for conveniently interacting with list- and
---map-style option from Lua: It allows accessing them as Lua tables and offers
---object-oriented method for adding and removing entries.
---
---Note that `vim.opt` returns an `Option` object, not the value of the option, which
---is accessed through `vim.opt:get()`.
---
---In any of the above examples, to replicate the behavior `:setlocal`, use
---`vim.opt_local`. Additionally, to replicate the behavior of `:setglobal`, use
---`vim.opt_global`.
local set = vim.opt

---@type table
---Mimic the vimscript `let <option>=<value>`
---Global (`g:`) editor variables.
---Key with no value returns `nil`.
local let = vim.g

---@type string
---_(global)_ **Default:** `""`
---This option is a list of comma-separated names. These names are recognized:
--- - **unnamed**: When included, Vim will use the clipboard register `"*"` for all
---   yank, delete, change and put operations which would normally go to the unnamed
---   register.  When a register is explicitly specified, it will always be used
---   regardless of whether "unnamed" is in `'clipboard'` or not.  The clipboard
---   register can always be explicitly accessed using the `"*` notation. Also see
---   `'clipboard'`.
--- - **unnamedplus**: A variant of the "unnamed" flag which uses the clipboard
---   register `"+"` (`'quoteplus'`) instead of register `"*"` for all yank, delete,
---   change and put operations which would normally go to the unnamed register.
---   When "unnamed" is also included to the option, yank and delete operations
---   (but not put) will additionally copy the text into register `'*'`. See
---   `'clipboard'`.
set.clipboard = "unnamedplus"

---@type boolean
---_(local to window)_ **Default:** `false`
---Highlight the text line of the cursor with CursorLine _hl-CursorLine_.
---Useful to easily spot the cursor.  Will make screen redrawing slower.  When
---Visual mode is active the highlighting isn't used to make it easier to see
---the selected text.
set.cursorline = true

---@type string| table<string>
---_(global or local to window _global-local_)_ **Default:**  `""`
---Characters to fill the statuslines, vertical separators and special lines in
---the window.  It is a comma-separated list of items.  Each item has a name, a
---colon and the value of that item:
---
---  ITEM         DEFAULT          USED FOR
---  stl          `' '` or `'^'`   statusline of the current window
---  stlnc        `' '` or `'='`   statusline of the non-current windows
---  wbr          `' '`          window bar
---  horiz        `'─'` or `'-'`   horizontal separators `:split`
---  horizup      `'┴'` or `'-'`   upwards facing horizontal separator
---  horizdown    `'┬'` or `'-'`   downwards facing horizontal separator
---  vert         `'│'` or `'|'`   vertical separators `:vsplit`
---  vertleft     `'┤'` or `'|'`   left facing vertical separator
---  vertright    `'├'` or `'|'`   right facing vertical separator
---  verthoriz    `'┼'` or `'+'`   overlapping vertical and horizontal separator
---  fold         `'·'` or `'-'`   filling `'foldtext'`
---  foldopen     `'-'`          mark the beginning of a fold
---  foldclose    `'+'`          show a closed fold
---  foldsep      `'│'` or `'|'`   open fold middle marker
---  diff         `'-'`          deleted lines of the `'diff'` option
---  msgsep       `' '`          message separator `'display'`
---  eob          `'~'`          empty lines at the end of a buffer
---  lastline     `'@'`          `'display'` contains lastline/truncate
---
---any one that is omitted will fall back to the default.  for "stl" and "stlnc"
---the space will be used when there is highlighting, `^` or `=` otherwise.
---
---note that "horiz", "horizup", "horizdown", "vertleft", "vertright" and
---"verthoriz" are only used when `laststatus` is 3, since only vertical window
---separators are used otherwise.
---
---if `ambiwidth` is "double" then "horiz", "horizup", "horizdown", "vert",
---"vertleft", "vertright", "verthoriz", "foldsep" and "fold" default to
---single-byte alternatives.
---
---example:
---```vim
---:set fillchars=stl:^,stlnc:=,vert:│,fold:·,diff:-
---```
---this is similar to the default, except that these characters will also
---be used when there is highlighting.
---
---for the "stl", "stlnc", "foldopen", "foldclose" and "foldsep" items
---single-byte and multibyte characters are supported.  but double-width
---characters are not supported.
---
---the highlighting used for these items:
---
---  ITEM        HIGHLIGHT GROUP
---  stl         statusline     `hl-statusline`
---  stlnc       statuslinenc   `hl-statuslinenc`
---  wbr         winbar         `hl-winbar` or `hl-winbarnc`
---  horiz       winseparator   `hl-winseparator`
---  horizup     winseparator   `hl-winseparator`
---  horizdown   winseparator   `hl-winseparator`
---  vert        winseparator   `hl-winseparator`
---  vertleft    winseparator   `hl-winseparator`
---  vertright   winseparator   `hl-winseparator`
---  verthoriz   winseparator   `hl-winseparator`
---  fold        folded         `hl-folded`
---  diff        diffdelete     `hl-diffdelete`
---  eob         endofbuffer    `hl-endofbuffer`
---  lastline    nontext        `hl-nontext`
set.fillchars = { eob = "~" }

---@type boolean
---_(global)_ **Default:** `off`
---Ignore case in search patterns.  Also used when searching in the tags file.
---Also see `'smartcase'` and `'tagcase'`.  Can be overruled by using "\c" or
---"\C" in the pattern, see `'/ignorecase'`.
set.ignorecase = true

---@type boolean
---_(global)_ **Default:** `off`
---Override the `'ignorecase'` option if the search pattern contains upper case
---characters.  Only used when the search pattern is typed and `'ignorecase'`
---option is on.  Used for the commands `"/"`, `"?"`, `"n"`, `"N"`, `":g"` and
---`":s"`.  Not used for `"*"`, `"#"`, `"gd"`, tag search, etc.  After `"*"` and
---`"#"` you can make `'smartcase'`` used by doing a `"/"` command, recalling the
---search pattern from history and hitting `<Enter>`.
set.smartcase = true

---@type string
---_(global)_ **Default:** `"nvi"`
---Enables mouse support. For example, to enable the mouse in Normal mode and
---Visual mode: `:set mouse=nv`
---
---To temporarily disable mouse support, hold the shift key while using the mouse.
---
---Mouse support can be enabled for different modes:
--- - **n**	Normal mode
--- - **v**	Visual mode
--- - **i**	Insert mode
--- - **c**	Command-line mode
--- - **h**	all previous modes when editing a help file
--- - **a**	all previous modes
--- - **r**	for `hit-enter` and `more-prompt` prompt
---
---Left-click anywhere in a text buffer to place the cursor there.  This works
---with operators too, e.g. type `d` then left-click to delete text	from the
---current cursor position to the position where you clicked.
---
---Drag the `status-line` or vertical separator of a window to resize it.
---
---If enabled for "v" (Visual mode) then double-click selects word-wise,
---triple-click makes it line-wise, and quadruple-click makes it rectangular
---block-wise.
---
---For scrolling with a mouse wheel see `scroll-mouse-wheel`.
---
---Note: When enabling the mouse in a terminal, copy/paste will use the `"*`
---register if possible. See also `'clipboard'`.
---
---Related options:
---`'mousefocus'`	window focus follows mouse pointer
---`'mousemodel'`	what mouse button does which action
---`'mousehide'`	hide mouse pointer while typing text
---`'selectmode'`	whether to start Select mode or Visual mode
---
---The `:behave` command provides some "profiles" for mouse behavior.
set.mouse = "a"

---@type boolean
---_(global)_ **Default:** `on`
---When there is a previous search pattern, highlight all its matches.
---The `hl-Search` highlight group determines the highlighting for all matches
---not under the cursor while the `hl-CurSearch` highlight group (if defined)
---determines the highlighting for the match under the cursor. If `hl-CurSearch`
---is not defined, then `hl-Search` is used for both. Note that only the
---matching text is highlighted, any offsets are not applied.
---See also: `'incsearch'` and `:match`.
---When you get bored looking at the highlighted matches, you can turn it off
---with `:nohlsearch`.  This does not change the option value, as soon as you
---use a search command, the highlighting comes back.  `'redrawtime'` specifies
---the maximum time spent on finding matches.  When the search pattern can match
---an end-of-line, Vim will try to highlight all of the matched text.  However,
---this depends on where the search starts.  This will be the first line in the
---window or the first line below a closed fold.  A match in a previous line
---which is not drawn may not continue in a newly drawn line.  You can specify
---whether the highlight status is restored on startup with the `'h'` flag in
---`'shada'` `shada-h`.
set.hlsearch = true

---@type boolean
---_(global)_ **Default:** `on`
---If in Insert, Replace or Visual mode put a message on the last line.  The
---`hl-ModeMsg` highlight group determines the highlighting.  The option has no
---effect when `'cmdheight'` is zero.
set.showmode = false

---@type number
---_(global)_ **Default:** `0`
---Enables pseudo-transparency for the `popup-menu`. Valid values are in the
---range of 0 for fully opaque popupmenu (disabled) to 100 for fully transparent
---background. Values between 0-30 are typically most useful.
---
---It is possible to override the level for individual highlights within the
---popupmenu using `highlight-blend`. For instance, to enable transparency but
---force the current selected element to be fully opaque:
---
---```vim
---:set pumblend=15
---:hi PmenuSel blend=0
---```
---
---UI-dependent. Works best with RGB colors. `'termguicolors'`
set.pumblend = 10

---@type boolean
---_(local to window)_ **Default:** `off`
---Print the line number in front of each line.  When the `'n'` option is excluded
---from `'cpoptions'` a wrapped line will not use the column of line numbers.
---
---Use the `'numberwidth'` option to adjust the room for the line number. When a
---long, wrapped line doesn't start with the first character, `'-'` characters are
---put before the number.  For highlighting see `hl-LineNr|, |hl-CursorLineNr`,
---and the `:sign-define` "numhl" argument.
set.number = true

---@type boolean
---_(local to window)_ **Default:** `off`
---Show the line number relative to the line with the cursor in front of each
---line. Relative line numbers help you use the `count` you can precede some
---vertical motion commands (e.g. j k + -) with, without having to calculate it
---yourself. Especially useful in combination with other commands
---(e.g. y d c < > gq gw =). When the `'n'` option is excluded from `'cpoptions'`
---a wrapped line will not use the column of line numbers.
---
---The `'numberwidth'` option can be used to set the room used for the line number.
---When a long, wrapped line doesn't start with the first character, `'-'` characters
---are put before the number. See `hl-LineNr` and `hl-CursorLineNr` for the
---highlighting used for the number.
---
---The number in front of the cursor line also depends on the value of 'number',
---see `number_relativenumber` for all combinations of the two options.
set.relativenumber = true

---@type number
---_(local to window)_ **Default:** `4`
---Minimal number of columns to use for the line number.  Only relevant when the
---`'number'` or `'relativenumber'` option is set or printing lines with a line number.
---Since one space is always between the number and the text, there is one less
---character for the number itself. The value is the minimum width.  A bigger
---width is used when needed to fit the highest line number in the buffer
---respectively the number of rows in the window, depending on whether `'number'`
---or `'relativenumber'` is set. Thus with the Vim default of 4 there is room for
---a line number up to 999. When the buffer has 1000 lines five columns will be
---used. The minimum value is 1, the maximum value is 20.
set.numberwidth = 2

---@type boolean
---_(global)_ **Default:** `on`
---Show the line and column number of the cursor position, separated by a comma.
---When there is room, the relative position of the displayed text in the file
---is shown on the far right:
--- - **Top**: first line is visible
--- - **Bot**: last line is visible
--- - **All**: first and last line are visible
--- - **45%**: relative position in the file
---
---If `'rulerformat'` is set, it will determine the contents of the ruler. Each
---window has its own ruler.  If a window has a status line, the ruler is shown
---there.  If a window doesn't have a status line and `'cmdheight'` is zero, the
---ruler is not shown.  Otherwise it is shown in the last line of the screen.
---If the statusline is given by `'statusline'` (i.e. not empty), this option takes
---precedence over `'ruler'` and `'rulerformat'`.
---If the number of characters displayed is different from the number of bytes in
---the text (e.g., for a TAB or a multibyte character), both the text column
---(byte number) and the screen column are shown, separated with a dash.
---For an empty line "0-1" is shown.
---For an empty buffer the line number will also be zero: "0,0-1".
---If you don't want to see the ruler all the time but want to know where you are,
---use "g CTRL-G".
set.ruler = false

---@type number
---_(local to buffer)_ **Default:** `8`
---Number of spaces that a `<Tab>` in the file counts for.  Also see the `:retab`
---command, and the `'softtabstop'` option.
---
---Note: Setting `'tabstop'` to any other value than 8 can make your file appear
---wrong in many places.
---The value must be more than 0 and less than 10000.
---
---There are four main ways to use tabs in Vim:
--- 1. Always keep `'tabstop'` at 8, set `'softtabstop'` and `'shiftwidth'` to 4
---    (or 3 or whatever you prefer) and use `'noexpandtab'`.  Then Vim will use
---    a mix of tabs and spaces, but typing `<Tab>` and `<BS>` will behave like
---    a tab appears every 4 (or 3) characters.
--- 2. Set `'tabstop'` and `'shiftwidth'` to whatever you prefer and use
---    `'expandtab'`.  This way you will always insert spaces.  The formatting
---    will never be messed up when `'tabstop'` is changed.
--- 3. Set `'tabstop'` and `'shiftwidth'` to whatever you prefer and use a
---    `modeline` to set these values when editing the file again.  Only works
---    when using Vim to edit the file.
--- 4. Always set `'tabstop'` and `'shiftwidth'` to the same value, and
---    `'noexpandtab'`.  This should then work (for initial indents only) for any
---    tabstop setting that people use.  It might be nice to have tabs after the
---    first non-blank inserted as spaces if you do this though.  Otherwise
---    aligned comments will be wrong when `'tabstop'` is changed.
---
---The value of `'tabstop'` will be ignored if `'vartabstop' is set to anything
---other than an empty string.
set.tabstop = 2

---@type number
---_(local to buffer)_ **Default:** `8`
---Number of spaces to use for each step of (auto)indent.  Used for `'cindent'`,
---`>>`, `<<`, etc. When zero the `'ts'` value will be used.  Use the `shiftwidth()`
---function to get the effective shiftwidth value.
set.shiftwidth = 2

---@type boolean
---_(local to buffer)_ **Default:** `off`
---In Insert mode: Use the appropriate number of spaces to insert a `<Tab>`.
---Spaces are used in indents with the `'>'` and `'<'` commands and when
---`'autoindent'` is on.  To insert a real tab when `'expandtab'` is on, use
---`CTRL-V<Tab>`.  See also `:retab` and `ins-expandtab`.
set.expandtab = true

---@type string
---_(local to window)_ **Default:** "auto"
---When and how to draw the signcolumn. Valid values are:
--- - **"auto"**: only when there is a sign to display
--- - **"auto:[1-9]"**: resize to accommodate multiple signs up to the given
---   number (maximum 9), e.g. `"auto:4"`
--- - **"auto:[1-8]-[2-9]"**: resize to accommodate multiple signs up to the
---   given maximum number (maximum 9) while keeping at least the given minimum
---   (maximum 8) fixed space. The minimum number should always be less than the
---   maximum number, e.g. `"auto:2-5"`
--- - **"no"**: never
--- - **"yes"**: always
--- - **"yes:[1-9]"**: always, with fixed space for signs up to the given number
---   (maximum 9), e.g. `"yes:3"`
--- - **"number"**: display signs in the 'number' column. If the number column is
---   not present, then behaves like `"auto"`.
---
---Note regarding "orphaned signs": with signcolumn numbers higher than 1, deleting
---lines will also remove the associated signs automatically, in contrast to the
---default Vim behavior of keeping and grouping them. This is done in order for
---the signcolumn appearance not appear weird during line deletion.
set.signcolumn = "yes"

---@type boolean
---_(global)_ **Default:** off
---When on, splitting a window will put the new window below the current one. `:split`.
set.splitbelow = true

---@type boolean
---_(global)_ **Default:** off
---When on, splitting a window will put the new window right of the current one. `:vsplit`
set.splitright = true

---@type boolean
---_(global)_ **Default:** `off`
---Enables 24-bit RGB color in the `TUI`.  Uses "gui" `:highlight` attributes instead
---of "cterm" attributes. `guifg` Requires an ISO-8613-3 compatible terminal.
set.termguicolors = true

---@type number
---_(global)_ **Default:** `1000`
---Time in milliseconds to wait for a mapped sequence to complete.
set.timeoutlen = 400

---@type boolean
---_(local to buffer)_ **Default:** `off`
---When on, Vim automatically saves undo history to an undo file when writing a
---buffer to a file, and restores undo history from the same file on buffer read.
---The directory where the undo file is stored is specified by `'undodir'`. For more
---information about this feature see `undo-persistence`. The undo file is not read
---when `'undoreload'` causes the buffer from before a reload to be saved for undo.
---When `'undofile'` is turned off the undo file is NOT deleted.
set.undofile = true

---@type number
---_(global)_ **Default:** 4000
---If this many milliseconds nothing is typed the swap file will be written to disk
---(see `crash-recovery`).  Also used for the CursorHold` autocommand event.
set.updatetime = 250

---go to previous/next line with h,l,left arrow and right arrow
---when cursor reaches end/beginning of line
set.whichwrap:append "<>[]hl"

---@type string
---_(local to window)_ **Default:** `""`
---`'colorcolumn'` is a comma-separated list of screen columns that are highlighted with
---ColorColumn `hl-ColorColumn`.  Useful to align text.  Will make screen redrawing
---slower. The screen column can be an absolute number, or a number preceded with
---`'+'` or `'-'`, which is added to or subtracted from `'textwidth'`.
---
---```vim
---:set cc=+1  " highlight column after 'textwidth'
---:set cc=+1,+2,+3  " highlight three columns after 'textwidth'
---:hi ColorColumn ctermbg=lightgrey guibg=lightgrey
---```
---
---When `'textwidth'` is zero then the items with `'-'` and `'+'` are not used.
---A maximum of 256 columns are highlighted.
set.colorcolumn = "81"

---@type string
---_(global)_ **Default:** `"\"`
---To define a mapping which uses the `g:mapleader` variable, the special string
---`"<Leader>"` can be used.  It is replaced with the string value of `g:mapleader`.
---If `g:mapleader` is not set or empty, a backslash is used instead.  Example:
---
---```vim
---map <Leader>A  oanother line<Esc>
---```
---Works like:
---```vim
---map \A  oanother line<Esc>
---```
---
---But after:
---```vim
---let mapleader = ","
---```
---
---It works like:
---```vim
---map ,A  oanother line<Esc>
---```
---
---Note that the value of `"g:mapleader"` is used at the moment the mapping is defined.
---Changing `"g:mapleader"` after that has no effect for already defined mappings.
let.mapleader = " "

---add binaries installed by mason.nvim to path
local is_windows = vim.loop.os_uname().sysname == "Windows_NT"
vim.env.PATH = vim.fn.stdpath "data"
  .. "/mason/bin"
  .. (is_windows and ";" or ":")
  .. vim.env.PATH

---@type string
---The path where luasnip will look for snippets
let.lua_snippets_path = vim.fn.stdpath "config" .. "/lua/snippets"

---Neovim providers
---@class Providers
---@field node    table Paths to the nodejs provider executable
---@field ruby    table Paths to the ruby provider executable
---@field perl    table Paths to the perl provider executable
---@field python3 table Paths to the python3 provider executable
local providers = {
  node = {
    lnx = "/home/linuxbrew/.linuxbrew/bin/neovim-node-host",
    win = "C:/Users/fsimo/AppData/Roaming/npm/node_modules/neovim/bin/cli.js",
  },

  ruby = {
    lnx = "/home/linuxbrew/.linuxbrew/bin/ruby",
    win = "C:/tools/ruby31/bin/ruby.exe",
  },

  perl = {
    lnx = "/usr/bin/perl",
    win = "C:/Strawberry/perl/bin/perl.exe",
  },

  python3 = {
    lnx = "/home/sravioli/.py-nvim/bin/python3",
    win = "C:/Users/fsimo/.py-nvim/Scripts/python.exe",
  },
}

---@param prov  string|table<string> Current provider
---@param paths table                The paths to the provider
for prov, paths in pairs(providers) do
  let["loaded_" .. prov .. "_provider"] = nil
  let[prov .. "_host_prog"] = paths[fn.get_os()]
end

---Load the diagnostic signs
local signs = require("srv.preferences").icons.diagnostics
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
