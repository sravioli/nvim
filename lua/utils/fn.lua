---@module "functions"
---@author sRavioli
---@license GPL-3.0
---@version 1.0.0

return {
  ---@type function Align a markdown table using `:Tabularize`
  align_table = function()
    ---@type string Pattern to identify a markdown table
    local pattern = "^%s*|%s.*%s|%s*$"
    local linenr, colnr = vim.fn.line ".", vim.fn.col "."
    local curr_line = vim.fn.getline "."
    local prev_line, next_line =
      vim.fn.getline(linenr - 1), vim.fn.getline(linenr + 1)

    if
      vim.fn.exists ":Tabularize"
      and curr_line:match "^%s*|"
      and (prev_line:match(pattern) or next_line:match(pattern))
    then
      local col = #curr_line:sub(1, colnr):gsub("[^|]", "")
      local pos = #vim.fn.matchstr(curr_line:sub(1, colnr), ".*|\\s*\\zs.*")
      -- `l` means left aligned and `1` means one space of cell padding
      vim.cmd "Tabularize/|/l1"
      vim.cmd "normal! 0"
      vim.fn.search(("[^|]*|"):rep(col) .. ("\\s\\{-\\}"):rep(pos), "ce", linenr)
    end
  end,
}
