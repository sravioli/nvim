---@class LspUtils
local M = {}

M.diagnostic = {}

---Retrieves the correct diagnostic sign based on the diagnostic severity
---@param severity integer the `vim.diagnostic.severity[<level>]`
---@return string|nil sign the diagnostic sign. nil if not found
---@return string|nil hl the diagnostic highlight. nil if not found
M.diagnostic.icon = function(severity)
  local signs = require("srv.preferences").icons.diagnostics
  for type, sign in pairs(signs) do
    if severity == vim.diagnostic.severity[type:upper()] then
      return sign, "DiagnosticSign" .. type
    end
  end
  return nil, nil
end

M.diagnostic.format = function(diagnostic)
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
