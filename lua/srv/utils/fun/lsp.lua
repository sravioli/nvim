---functions for lsp related stuff
---
---@class Fun.lsp
local M = {}

---Retrieves the diagnostic icon based on the given severity
---@param severity vim.diagnostic.Severity the `:h vim.diagnostic.severity` level
---@return string|nil sign icon corresponding to the severity level. `nil` if not found.
---@return string|nil hl highlight for the icon. `nil` if not found
M.get_icon = function(severity)
  local signs = require("srv.preferences").icons.diagnostics
  for type, sign in pairs(signs) do
    if severity == vim.diagnostic.severity[type:upper()] then
      return sign, "DiagnosticSign" .. type
    end
  end
  return nil, nil
end

---Formats the diagnostic message from the LSP or other source.
---@param diagnostic table the `:h diagnostic-structure` table from the LSP.
---@return string fmt the formatted LSP diagnostics message
M.format_message = function(diagnostic)
  local fmt = ""

  local msg = diagnostic.message
  if diagnostic.source then
    msg = msg:gsub("%(" .. diagnostic.source .. "%)", "")
    local source =
      diagnostic.source:gsub("^[%p%s]*(.-)[%p%s]*$", "%1"):gsub("[%s]", "-"):lower()
    fmt = fmt .. ("%s:"):format(source)
  end

  if diagnostic.code then
    msg = msg:gsub("%[" .. diagnostic.code .. "%]", "")
    fmt = fmt .. (" [%s]"):format(diagnostic.code)
  end

  fmt = fmt .. (" %s"):format(msg)

  return fmt
end

return M
