return {
	---file explorer tree for neovim written in lua
	"nvim-tree/nvim-tree.lua",
	version = "*",
	dependencies = {
		{ "nvim-tree/nvim-web-devicons" },
		{
			---prompts the user to pick a window and returns the window id of the picked window
			"s1n7ax/nvim-window-picker",
			name = "window-picker",
			version = "2.*",
			opts = {
				hint = "floating-big-letter",
				show_prompt = false,
				filter_rules = {
					include_current_win = true,
					bo = { filetype = { "NvimTree", "neo-tree", "notify", "fidget" } },
				},
			},
		},
	},
	cmd = {
		"NvimTreeOpen",
		"NvimTreeClose",
		"NvimTreeToggle",
		"NvimTreeFocus",
		"NvimTreeRefresh",
		"NvimTreeFindFile",
		"NvimTreeFindFileToggle",
		"NvimTreeClipboard",
		"NvimTreeResize",
		"NvimTreeCollapse",
		"NvimTreeCollapseKeepBuffers",
	},
	keys = {
		{ "<C-n>", "<cmd>NvimTreeToggle<CR>", desc = "  Toggle file explorer" },
		{
			"<leader>e",
			"<cmd>NvimTreeFindFileToggle<CR>",
			desc = "  Focus current file in explorer",
		},
	},
	opts = function()
		local fun = require("srv.utils.fun") ---@class Fun
		local icons = require("srv.preferences").icons ---@class Icons
		local border = require("srv.preferences").border

		return {
			on_attach = fun.tree.on_attach,
			hijack_cursor = true, ---keep cursor on first letter of filename
			disable_netrw = true, ---completely disable netrw
			hijack_unnamed_buffer_when_opening = false, ---open in empty unnamed buffers
			sync_root_with_cwd = true, ---change cwd on `DirChanged`
			reload_on_bufenter = true, ---update on `BufEnter`
			select_prompts = true, ---`vim.ui.select` prompts

			live_filter = {
				prefix = "[FILTER]: ",
				always_show_folders = false, -- Turn into false from true by default
			},

			view = {
				cursorline = true,
				side = "left",
				signcolumn = "auto",

				width = { padding = 2 },

				float = {
					enable = false,
					quit_on_focus_loss = true,
					open_win_config = {
						relative = "editor",
						border = border,
						width = math.floor(vim.opt.columns:get() * 0.25),
						height = math.floor((vim.opt.lines:get() - vim.opt.cmdheight:get()) * 0.90),
						row = 1,
						col = 1,
					},
				},
			},

			renderer = {
				group_empty = true,
				full_name = true,
				root_folder_label = function(root_cwd)
					return root_cwd:gsub(os.getenv("USERPROFILE") or os.getenv("HOME"), "~"):gsub("\\", "/") .. "/"
				end,

				highlight_git = true,
				highlight_diagnostics = true,
				highlight_opened_files = "name",

				indent_markers = {
					enable = true,
					inline_arrows = true,
					icons = { corner = "╰" },
				},

				icons = {
					web_devicons = { folder = { enable = true } },

					git_placement = "signcolumn",
					diagnostics_placement = "after",
					symlink_arrow = " 󰁔 ",

					glyphs = {
						git = {
							unstaged = icons.git.Unstaged,
							staged = icons.git.Staged,
							renamed = icons.git.Renamed,
							untracked = icons.git.Untracked,
							deleted = icons.git.Deleted,
							ignored = icons.git.Ignored,
						},
					},
				},
			},

			hijack_directories = { enable = true },

			diagnostics = {
				enable = true,
				icons = {
					hint = icons.diagnostics.Hint,
					info = icons.diagnostics.Info,
					warning = icons.diagnostics.Warn,
					error = icons.diagnostics.Error,
				},
			},

			modified = { enable = true },

			filters = {
				dotfiles = true,
				exclude = { ".gitignore", ".github" },
			},

			actions = {
				file_popup = {
					open_win_config = { border = border },
				},
				open_file = {
					window_picker = {
						picker = require("window-picker").pick_window,
					},
				},
			},

			trash = { cmd = "trash" },
		}
	end,
}
