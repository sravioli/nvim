---User defined functions
---@module "functions"
---@author sRavioli
---@license GPL-3.0

---User defined utility functions
---@class Functions
---@field mappings table Functions related to keymaps
---@field telescope table Functions related to the telescope plugin
---@field lsp table Functions related to the Language Server Protocol
---@field snippets table Functions related to LuaSnip
local Functions = { mappings = {}, telescope = {}, lsp = {}, snippets = {} }

---Aligns a markdown table in insert mode
---@return nil
Functions.align_table = function()
  local pattern = "^%s*|%s.*%s|%s*$"
  local linenr, colnr = vim.fn.line ".", vim.fn.col "."
  local curr_line = vim.fn.getline "."
  local prev_line, next_line = vim.fn.getline(linenr - 1), vim.fn.getline(linenr + 1)

  if
    vim.fn.exists ":Tabularize"
    and curr_line:match "^%s*|"
    and (prev_line:match(pattern) or next_line:match(pattern))
  then
    local col = #curr_line:sub(1, colnr):gsub("[^|]", "")
    local pos = #vim.fn.matchstr(curr_line:sub(1, colnr), ".*|\\s*\\zs.*")

    ---`l` means left aligned and `1` means one space of cell padding
    vim.cmd "Tabularize/|/l1"
    vim.cmd "normal! 0"
    vim.fn.search(("[^|]*|"):rep(col) .. ("\\s\\{-\\}"):rep(pos), "ce", linenr)
  end
end

---Condense the LuaSnip snippet context for snippets
---@param trig string The sequence that triggers the snippet.
---@param name string Can be used by e.g. nvim-compe to identify the snippet.
---@param desc string|table The description. Can be multiline (either with `\n` or table).
---@param snippetType? string Determines if this snippet has to be triggered manually (`"snippet"`) or automatically (`"autosnippet"`).
---@param trigEngine? string|function How `trig` is interpreted. Defaults to `"plain"` and supports: `"pattern"`, `ecma"`, `"vim"` or a custom function.
---@param wordTrig? boolean Whether to expand the snippet if the word (`[%w_]+`) matches `trig` entirely. `True` by default.
---@param priority? number The priority of the snippet. `1000` by default. Snippets with high priority will be matched to a trigger before those with a lower one
---@return table context The assembled LuaSnip context
Functions.snippets.snip = function(
  trig,
  name,
  desc,
  snippetType,
  wordTrig,
  trigEngine,
  priority
)
  return {
    trig = trig,
    name = name,
    desc = desc,
    snippetType = snippetType and snippetType or "snippet",
    trigEngine = trigEngine and trigEngine or "plain",
    wordTrig = wordTrig and true,
    priority = priority or 1000,
  }
end

return Functions
