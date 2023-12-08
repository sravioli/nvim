--- Various utilities for `nvim-cmp`
---@class CmpUtils
---@field functions CmpFunctions
---@field mappings CmpMappings
---@field sources CmpSources
local M = {}

setmetatable(M, {
  __index = function(t, k)
    t[k] = require("srv.utils.cmp." .. k)
    return t[k]
  end,
})

return M

