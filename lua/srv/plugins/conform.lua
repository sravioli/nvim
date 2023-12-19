local fun = require("srv.utils.fun") ---@class Fun

return {
	---lightweight yet powerful formatter plugin for Neovim
	"stevearc/conform.nvim",
	event = "BufWritePre",
	cmd = "ConformInfo",
	keys = {
		{
			"<leader>cf",
			function()
				require("conform").format({ async = true, lsp_fallback = true })
			end,
			mode = "",
			desc = "󰉢  Format buffer",
		},
	},
	init = function()
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			markdown = { "markdownlint-cli2", "cbfmt" },
			yaml = { "yamlfix" },
			json = { "fixjson" },
			c = { "clang_format" },
			cpp = { "clang_format" },
		},

		formatters = {
			stylua = {
				prepend_args = function()
					local file = fun.search_file(".stylua.toml")
					return file and { "--config-path", file } or {}
				end,
			},
			["markdownlint-cli2"] = {
				prepend_args = function()
					local file = fun.search_file(".markdownlint.jsonc")
					return file and { "--config", file } or {}
				end,
			},
			taplo = {
				prepend_args = function()
					local file = fun.search_file(".taplo.toml")
					return file and { "--config", file } or {}
				end,
			},
			yamlfix = {
				prepend_args = function()
					local file = fun.search_file(".yamlfix.toml")
					return file and { "--config-file", file } or {}
				end,
			},
			fixjson = {
				args = { "--indent", vim.opt.tabstop:get() },
			},
			clang_format = {
				prepend_args = function()
					local file = fun.search_file(".clang-format")
					return file and { "--style=file:" .. file } or {}
				end,
			},
		},

		format_on_save = { timeout_ms = 1000, lsp_fallback = true },
	},
}
