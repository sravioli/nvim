---Functions to format text
---
---@class Fun.fmt
local M = {}

---Updates the "last updated/changed/modified" timestamp of a file
M.update_timestamp = function()
  if not vim.api.nvim_buf_get_option(0, "modifiable") then
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

M.search_config_file = function(filename)
  local dirs = { vim.fn.expand "%:p:h" }
  local ls_present, ls_utils = pcall(require, "lspconfig.utils")
  if ls_present then
    table.insert(dirs, (ls_utils.root_pattern(filename)))
    table.insert(dirs, (ls_utils.find_git_ancestor()))
    table.insert(dirs, (ls_utils.find_node_modules_ancestor()))
    table.insert(dirs, (ls_utils.find_package_json_ancestor()))
  end

  table.insert(dirs, (vim.uv.cwd()))
  table.insert(dirs, vim.fn.resolve(vim.fn.stdpath "config" .. [[\skel]]))

  vim.notify(dirs)

  for _, dir in pairs(dirs) do
    vim.notify(
      ("[null-ls] searching '%s'"):format(vim.fn.resolve(dir .. filename)),
      vim.log.levels.TRACE
    )
    local file = vim.fn.findfile(vim.fn.resolve(dir .. "/" .. filename))
    if file ~= "" then
      vim.notify(("[null-ls] found '%s'"):format(file), vim.log.levels.TRACE)
      return file
    end
  end
  return ""
end

return M

