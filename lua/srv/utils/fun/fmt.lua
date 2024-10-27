---Functions to format text
---
---@class Fun.fmt
local M = {}

---Updates the "last updated/changed/modified" timestamp of a file
M.update_timestamp = function()
  local get_val = vim.api.nvim_get_option_value
  if not get_val("modifiable", {}) or not get_val("modified", {}) then
    return
  end

  local MAX_LINES = 30
  local buflines = vim.api.nvim_buf_line_count(0)
  local re =
    vim.regex [[\(Last\)\?\s*\([Cc]hanged\?\|[Mm]odified\|[Uu]pdated\?\)\s*:\s*\zs.*]]
  if not re then
    vim.notify("[timestamp]: unable to create regex", vim.diagnostic.severity.ERROR)
    return
  end

  for linenr = 1, (buflines < MAX_LINES and buflines or MAX_LINES) do
    local line = vim.fn.getline(linenr)
    if type(line) == "table" then
      line = select(1, unpack(line))
    end

    local colnr = re:match_str(line)
    if colnr then
      vim.fn.setline(linenr, line:sub(1, colnr) .. os.date "%Y-%m-%d %H:%M")
    end
  end
end

M.markdown_table = function() end

return M
