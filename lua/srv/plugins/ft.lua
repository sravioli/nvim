return {
	-- {{{1 MARKDOWN
	{
		--~ {{{2 glow.nvim: markdown preview directly in neovim.
		{
			"ellisonleao/glow.nvim",
			ft = "markdown",
			keys = {
				{ "<leader>fg", "<cmd>Glow<CR>", desc = "  Preview file with Glow" },
			},
			cmd = "Glow",
			opts = {
				border = require("srv.preferences").border,
				width_ratio = 0.9,
				height_ratio = 0.82,
				width = math.floor(vim.opt.columns:get() * 0.9),
				height = math.floor(vim.opt.lines:get() * 0.82),
				style = "C:/Users/fsimo/Documents/kanagawa/extras/glow/kanagawa-wave.json",
			},
		}, --~ }}}

		--~ {{{2 vimtex: minimal, opinionated neovim filetype plugin for (La)TeX and Markdown
		{
			"lervag/vimtex",
			ft = "markdown",
			init = function()
				vim.cmd.filetype("plugin indent on")
				vim.cmd.syntax("enable")
				vim.g.vimtex_view_general_viewer = "sioyek"
				vim.g.vimtex_view_general_options = "--reuse-window --execute-command toggle_synctex"
			end,
		}, --~ }}}

		--~ {{{2 nvim-FeMaco.lua: catalyze your Fenced Markdown Code-block editing!
		{
			"AckslD/nvim-FeMaco.lua",
			ft = "markdown",
			keys = {
				{
					"<leader>ce",
					function()
						require("femaco.edit").edit_code_block()
					end,
					desc = "󱚌  Edit code block with FeMaco",
				},
			},
			opts = {
				ensure_newline = function()
					return true
				end,
			},
		}, --~ }}}

		--~ {{{2 nabla.nvim: take your scientific notes ✏️ in Neovim
		{
			"jbyuki/nabla.nvim",
			ft = "markdown",
			keys = {
				{
					"<leader>cp",
					function()
						require("nabla").popup({ border = require("srv.preferences").border })
					end,
					desc = "∇  Open Nabla popup",
				},
			},
		}, --~ }}}

		--~ {{{2 vim-ditto: 🙊 Stop repeating yourself
		{
			"dbmrq/vim-ditto",
			ft = { "markdown", "text" },
			keys = {
				{ "<leader>tD", "<Plug>ToggleDitto", desc = "  Toggle ditto" },
			},
			cmd = {
				"ToggleDitto",
				"Ditto",
				"NoDitto",
				"DittoSent",
				"DittoPar",
				"DittoFile",
			},
			init = function()
				vim.g.ditto_min_word_length = 5
				vim.g.ditto_min_repetitions = 4
				vim.g.ditto_hlgroups = {
					"@punctuation",
					"@constant",
					"@define",
					"@string",
					"@number",
					"@field",
					"@conditional",
					"@type",
				}
				vim.g.ditto_dir = vim.fn.stdpath("config")
				vim.g.ditto_file = ".ditto.txt"
			end,
		}, --~ }}}

		--~ {{{2 obsidian.nvim: Neovim plugin for Obsidian, written in Lua
		{
			"epwalsh/obsidian.nvim",
			enabled = false,
			-- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand':
			event = "BufReadPre " .. vim.fn.expand("~") .. [[\Documents\knowledge-base\**.md]],
			dependencies = {
				{ "nvim-lua/plenary.nvim" }, ---Required.
				{ "hrsh7th/nvim-cmp" }, ---Optional, for completion.
				{ "nvim-telescope/telescope.nvim" }, ---For search and quick-switch functionality.

				---Optional, alternative to nvim-treesitter for syntax highlighting.
				{ "godlygeek/tabular" },
				{ "preservim/vim-markdown" },
			},
			opts = {
				dir = "~/Documents/knowledge-base/", ---no need to call 'vim.fn.expand' here

				---Optional, if you keep notes in a specific subdirectory of your vault.
				notes_subdir = "notes",

				---Optional, set the log level for Obsidian. This is an integer corresponding to
				---one of the log levels defined by "vim.log.levels.*" or nil, which is equivalent
				---to DEBUG (1).
				log_level = vim.log.levels.DEBUG,

				daily_notes = {
					-- Optional, if you keep daily notes in a separate directory.
					folder = "notes/dailies",
					-- Optional, if you want to change the date format for daily notes.
					date_format = "%Y-%m-%d",
				},

				---Optional, completion.
				completion = {
					---If using nvim-cmp, otherwise set to false
					nvim_cmp = true,
					---Trigger completion at 2 chars
					min_chars = 2,
					---Where to put new notes created from completion. Valid options are
					--- * "current_dir" - put new notes in same directory as the current buffer.
					--- * "notes_subdir" - put new notes in the default notes subdirectory.
					new_notes_location = "current_dir",
				},

				---Optional, set to true if you don't want Obsidian to manage frontmatter.
				disable_frontmatter = false,

				---Optional, for templates (see below).
				templates = {
					subdir = "templates",
					date_format = "%Y-%m-%d-%a",
					time_format = "%H:%M",
				},

				---Optional, by default when you use `:ObsidianFollowLink` on a link to an external
				---URL it will be ignored but you can customize this behavior here.
				follow_url_func = function(url)
					---Open the URL in the default web browser.
					vim.fn.jobstart({ "start", url }) -- Windows
					-- vim.fn.jobstart { "open", url } -- Mac OS
					-- vim.fn.jobstart({"xdg-open", url})  -- linux
				end,

				---Optional, set to true if you use the Obsidian Advanced URI plugin.
				---https://github.com/Vinzent03/obsidian-advanced-uri
				use_advanced_uri = true,

				-- Optional, set to true to force ':ObsidianOpen' to bring the app to the foreground.
				open_app_foreground = false,

				---Optional, by default commands like `:ObsidianSearch` will attempt to use
				---telescope.nvim, fzf-lua, and fzf.nvim (in that order), and use the
				---first one they find. By setting this option to your preferred
				---finder you can attempt it first. Note that if the specified finder
				---is not installed, or if it the command does not support it, the
				---remaining finders will be attempted in the original order.
				finder = "telescope.nvim",
			},
			config = function(_, opts)
				require("obsidian").setup(opts)

				---Optional, override the 'gf' keymap to utilize Obsidian's search functionality.
				---see also: 'follow_url_func' config option above.
				vim.keymap.set("n", "gf", function()
					if require("obsidian").util.cursor_on_markdown_link() then
						return "<cmd>ObsidianFollowLink<CR>"
					else
						return "gf"
					end
				end, { noremap = false, expr = true })
			end,
		}, --~ }}}

		--~ {{{2 vim-pencil: rethinking Vim as a tool for writing
		{
			"preservim/vim-pencil",
			cmd = { "Pencil", "PencilOff", "PencilToggle", "PencilSoft", "PencilHard" },
			config = function()
				vim.cmd("let g:pencil#wrapModeDefault = 'hard'")
				vim.cmd("let g:pencil#autoformat = 1")
				vim.cmd("let g:pencil#textwidth = " .. tonumber(vim.opt_local.colorcolumn["_value"] or 0))
			end,
		}, --~ }}}

		--~ {{{2 markdown-preview.nvim: markdown preview plugin for (neo)vim
		{
			"iamcco/markdown-preview.nvim",
			cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
			build = "cd app && yarn install",
			init = function()
				vim.g.mkdp_filetypes = { "markdown" }
			end,
			ft = { "markdown" },
		}, --~ }}}
	}, -- }}}
}

-- vim: fdm=marker fdl=1
