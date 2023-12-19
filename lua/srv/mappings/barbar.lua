---@class Mappings
return {
	autoload = false,

	n = {
		["<S-Tab>"] = { "<cmd>BufferPrevious<CR>", "󰒭  Next buffer" },
		["<Tab>"] = { "<cmd>BufferNext<CR>", "󰒮  Prev buffer" },
		---Re-order to previous/next
		["<leader>bh"] = {
			"<cmd>BufferMovePrevious<CR>",
			"󰁎  Move buffer left",
		},
		["<leader>bl"] = {
			"<cmd>BufferMoveNext<CR>",
			"  Move buffer right",
		},
		---Goto buffer in position...
		["<leader>b1"] = { "<cmd>BufferGoto 1<CR>", "󰎤  Goto buffer 1" },
		["<leader>b2"] = { "<cmd>BufferGoto 2<CR>", "󰎧  Goto buffer 2" },
		["<leader>b3"] = { "<cmd>BufferGoto 3<CR>", "󰎪  Goto buffer 3" },
		["<leader>b4"] = { "<cmd>BufferGoto 4<CR>", "󰎭  Goto buffer 4" },
		["<leader>b5"] = { "<cmd>BufferGoto 5<CR>", "󰎱  Goto buffer 5" },
		["<leader>b6"] = { "<cmd>BufferGoto 6<CR>", "󰎳  Goto buffer 6" },
		["<leader>b7"] = { "<cmd>BufferGoto 7<CR>", "󰎶  Goto buffer 7" },
		["<leader>b8"] = { "<cmd>BufferGoto 8<CR>", "󰎹  Goto buffer 8" },
		["<leader>b9"] = { "<cmd>BufferGoto 9<CR>", "󰎼  Goto buffer 9" },
		["<leader>b0"] = { "<cmd>BufferLast<CR>", "󰘁  Goto last buffer" },
		---Pin/unpin buffer
		["<leader>bP"] = { "<cmd>BufferPin<CR>", "  Pin buffer" },
		---Close buffer
		["<leader>bx"] = { "<cmd>BufferClose<CR>", "  Close buffer" },
		---Wipeout buffer
		---                <cmd>BufferWipeout
		---Close commands
		---                <cmd>BufferCloseAllButCurrent
		---                <cmd>BufferCloseAllButPinned
		---                <cmd>BufferCloseAllButCurrentOrPinned
		---                <cmd>BufferCloseBuffersLeft
		---                <cmd>BufferCloseBuffersRight
		---Magic buffer-picking mode
		["<leader>bp"] = { "<cmd>BufferPick<CR>", "󰢷  Pick buffer" },
		---Sort automatically by...
		["<leader>bb"] = {
			"<cmd>BufferOrderByBufferNumber<CR>",
			"  Re-order buffers by number",
		},
		["<leader>bd"] = {
			"<cmd>BufferOrderByDirectory<CR>",
			"󰒼  Re-order buffers by directory",
		},
		["<leader>bL"] = {
			"<cmd>BufferOrderByLanguage<CR>",
			"  Re-order buffers by language",
		},
		["<leader>bw"] = {
			"<cmd>BufferOrderByWindowNumber<CR>",
			"󰫒  Re-order buffers by window number",
		},

		---Other:
		---:BarbarEnable - enables barbar (enabled by default)
		---:BarbarDisable - very bad command, should never be used
	},
}
