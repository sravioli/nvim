---@class Mappings
return {
	autoload = false,

	n = {
		---Navigation through hunks
		["]c"] = {
			function()
				if vim.wo.diff then
					return "]c"
				end
				vim.schedule(function()
					require("gitsigns").next_hunk()
				end)
				return "<Ignore>"
			end,
			"󱋿  Jump to next hunk",
			opts = { expr = true },
		},

		["[c"] = {
			function()
				if vim.wo.diff then
					return "[c"
				end
				vim.schedule(function()
					require("gitsigns").prev_hunk()
				end)
				return "<Ignore>"
			end,
			"󱋿  Jump to prev hunk",
			opts = { expr = true },
		},

		---Actions
		["<leader>hs"] = {
			function()
				require("gitsigns").stage_hunk()
			end,
			"󰊢  Stage hunk",
		},
		["<leader>hr"] = {
			function()
				require("gitsigns").reset_hunk()
			end,
			"󰊢  Reset hunk",
		},

		["<leader>hS"] = {
			function()
				require("gitsigns").stage_buffer()
			end,
			"󰊢  Stage buffer",
		},
		["<leader>hu"] = {
			function()
				require("gitsigns").undo_stage_hunk()
			end,
			"󰊢  Undo stage hunk",
		},
		["<leader>hR"] = {
			function()
				require("gitsigns").reset_buffer()
			end,
			"󰊢  Reset buffer",
		},
		["<leader>hp"] = {
			function()
				require("gitsigns").preview_hunk()
			end,
			"󰊢  Preview hunk",
		},
		["<leader>hb"] = {
			function()
				require("gitsigns").blame_line({ full = true })
			end,
			"󰊢  Enable line blame",
		},
		["<leader>tb"] = {
			function()
				require("gitsigns").toggle_current_line_blame()
			end,
			"󰊢  Toggle current line blame",
		},
		["<leader>hd"] = {
			function()
				require("gitsigns").diffthis()
			end,
			"󰊢  Diff this",
		},
		["<leader>hD"] = {
			function()
				require("gitsigns").diffthis("~")
			end,
			"󰊢  Diff this",
		},
		["<leader>td"] = {
			function()
				require("gitsigns").toggle_deleted()
			end,
			"󰊢  Toggle deleted",
		},
	},

	v = {
		["<leader>hs"] = {
			function()
				require("gitsigns").stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end,
			"󰊢  Stage hunk",
		},

		["<leader>hr"] = {
			function()
				require("gitsigns").reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end,
			"󰊢  Reset hunk",
		},
	},

	o = {
		["ih"] = { ":<C-U>Gitsigns select_hunk<CR>", "󰊢  Select hunk" },
	},

	x = {
		["ih"] = { ":<C-U>Gitsigns select_hunk<CR>", "󰊢  Select hunk" },
	},
}
