return {
	-- {{{1 mason-nvim-dap: bridge mason.nvim w/ nvim-dap
	{
		"jay-babu/mason-nvim-dap.nvim",
    cond = not vim.g.vscode,
		dependencies = {
			{ "williamboman/mason.nvim" },
		},
		cmd = { "DapInstall", "DapUninstall" },
		opts = {
			automatic_installation = true,
			handlers = {},
			ensure_installed = { "codelldb" },
		},
	}, -- }}}

	-- {{{1 nvim-dap-ui: UI for nvim-dap
	{
		"rcarriga/nvim-dap-ui",
    cond = not vim.g.vscode,
		dependencies = { "mfussenegger/nvim-dap" },
		keys = {
			{
				"<leader>du",
				function()
					require("dapui").toggle({})
				end,
				desc = "  Dap UI",
			},
			{
				"<leader>de",
				function()
					require("dapui").eval()
				end,
				desc = "󰜎  Eval",
				mode = { "n", "v" },
			},
		},
		opts = {},
		config = function(_, opts)
			local dap = require("dap")
			local dapui = require("dapui")
			dapui.setup(opts)
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open({})
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close({})
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close({})
			end
		end,
	}, -- }}}

	-- {{{1 nvim-dap-virtual-text: adds virtual text support to nvim-dap
	{
		"theHamsta/nvim-dap-virtual-text",
    cond = not vim.g.vscode,
		opts = { commented = true },
	},
	-- }}}

	-- {{{1 nvim-dap: Debug Adapter Protocol client implementation for Neovim
	{
		"mfussenegger/nvim-dap",
    cond = not vim.g.vscode,
		dependencies = { "jay-babu/mason-nvim-dap.nvim" },
		keys = {
			{
				"<leader>dB",
				function()
					require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
				end,
				desc = "  Breakpoint Condition",
			},
			{
				"<leader>db",
				function()
					require("dap").toggle_breakpoint()
				end,
				desc = "  Toggle Breakpoint",
			},
			{
				"<leader>dc",
				function()
					require("dap").continue()
				end,
				desc = "  Continue",
			},
			{
				"<leader>dC",
				function()
					require("dap").run_to_cursor()
				end,
				desc = "  Run to Cursor",
			},
			{
				"<leader>dg",
				function()
					require("dap").goto_()
				end,
				desc = "Go to line (no execute)",
			},
			{
				"<leader>di",
				function()
					require("dap").step_into()
				end,
				desc = "  Step Into",
			},
			{
				"<leader>dj",
				function()
					require("dap").down()
				end,
				desc = "󰁅  Down",
			},
			{
				"<leader>dk",
				function()
					require("dap").up()
				end,
				desc = "󰁝  Up",
			},
			{
				"<leader>dl",
				function()
					require("dap").run_last()
				end,
				desc = "󰘁  Run Last",
			},
			{
				"<leader>do",
				function()
					require("dap").step_out()
				end,
				desc = "󰆸  Step Out",
			},
			{
				"<leader>dO",
				function()
					require("dap").step_over()
				end,
				desc = "󰆷  Step Over",
			},
			{
				"<leader>dp",
				function()
					require("dap").pause()
				end,
				desc = "  Pause",
			},
			{
				"<leader>dr",
				function()
					require("dap").repl.toggle()
				end,
				desc = "  Toggle REPL",
			},
			{
				"<leader>ds",
				function()
					require("dap").session()
				end,
				desc = "  Session",
			},
			{
				"<leader>dt",
				function()
					require("dap").terminate()
				end,
				desc = "  Terminate",
			},
			{
				"<leader>dw",
				function()
					require("dap.ui.widgets").hover()
				end,
				desc = "Widgets",
			},
		},
		config = function()
			local icons = require("srv.preferences").icons
			vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })

			for name, sign in pairs(icons.dap) do
				sign = type(sign) == "table" and sign or { sign }
				vim.fn.sign_define("Dap" .. name, {
					text = sign[1],
					texthl = sign[2] or "DiagnosticInfo",
					linehl = sign[3],
					numhl = sign[3],
				})
			end
		end,
	},
	-- }}}
}

-- vim: fdm=marker fdl=0
