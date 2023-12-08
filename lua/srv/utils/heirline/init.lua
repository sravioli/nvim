---Heirline statuslines
---@class HeirlineLines
---@field statusline table
local M = {}

setmetatable(M, {
  __index = function(t, k)
    t[k] = require("srv.utils.heirline." .. k)
    return t[k]
  end,
})

return M

