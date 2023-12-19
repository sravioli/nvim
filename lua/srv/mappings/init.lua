---@class Keymaps: table[]
---@field barbar? Mappings
---@field gitsigns? Mappings
---@field hls-lens? Mappings
---@field lsp? Mappings
---@field lspsaga? Mappings
---@field luasnip? Mappings
---@field nvim? Mappings
---@field tree-sitter? Mappings
return {
	nvim = require("srv.mappings.nvim"),
	lsp = require("srv.mappings.lsp"),
	barbar = require("srv.mappings.barbar"),
	gitsigns = require("srv.mappings.gitsigns"),
	lspsaga = require("srv.mappings.lspsaga"),
	["hls-lens"] = require("srv.mappings.hls-lens"),
}
