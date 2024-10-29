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

M.neorg_create_backlink = function()
  local function create_link(dir, word)
    vim.cmd(
      ([=[%%s#\<[%s%s]%s\(s\?\)\>#{:$/%s/%s:}[%s\1]#gIe]=]):format(
        word:sub(1, 1):upper(),
        word:sub(1, 1),
        word:sub(2),
        dir,
        word:upper(),
        word:gsub("-", " ")
      )
    )
  end

  local words = vim.fn.split(vim.fn.input "Element(s) to create backlinks for: ", " ")
  if #words == 0 then
    return
  end
  local dir = vim.fn.input "Dir to operate: "
  if dir == "" then
    return
  end
  if #words == 1 then
    return create_link(dir, words[1])
  end

  for i = 1, #words do
    create_link(dir, words[i])
  end
end

return M
