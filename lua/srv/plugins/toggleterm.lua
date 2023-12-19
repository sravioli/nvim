return {
	---neovim lua plugin to help easily manage multiple terminal windows
	"akinsho/toggleterm.nvim",
	keys = {
		{
			"<M-i>",
			"<cmd>ToggleTerm direction=float<CR>",
			desc = "  Toggle floating terminal",
			mode = { "n", "t" },
		},
		{
			"<M-h>",
			"<cmd>ToggleTerm direction=horizontal<CR>",
			desc = "  Toggle horizontal terminal",
			mode = { "n", "t" },
		},
		{
			"<M-v>",
			"<cmd>ToggleTerm direction=vertical<CR>",
			desc = "  Toggle vertical terminal",
			mode = { "n", "t" },
		},
	},
	version = "*",
	opts = {
		shade_terminals = false,
		size = function(term)
			if term.direction == "horizontal" then
				return 15
			elseif term.direction == "vertical" then
				return vim.o.columns * 0.4
			end
		end,
		direction = "float",
		float_opts = {
			border = require("srv.preferences").border,
			width = function()
				return math.floor(vim.opt.columns:get() * 0.85)
			end,
			height = function()
				return math.floor((vim.opt.lines:get() - vim.opt.cmdheight:get()) * 0.85)
			end,
		},
		highlights = {
			FloatBorder = { link = "NormalDark" },
			NormalFloat = { link = "NormalDark" },
		},
	},
}
