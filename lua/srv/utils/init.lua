---Utilities
---@class Utils
---@field cmp CmpUtils
---@field heirline HeirlineLines
---@field nvim-tree table
---@field duck Duck
---@field event EventUtils
---@field keymaps KeymapUtils
---@field lsp LspUtils
local M = {}

setmetatable(M, {
	__index = function(t, k)
		t[k] = require("srv.utils." .. k)
		return t[k]
	end,
})

return M
