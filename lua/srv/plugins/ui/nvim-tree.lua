return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    { "nvim-tree/nvim-web-devicons" },
  },
  opts = function()
    ---@class Icons
    local icons = require("srv.preferences").icons
    local border = require("srv.preferences").border

    return {
      ---to set nvim-tree specific mappings
      on_attach = function(bufnr)
        require("srv.utils.nvim-tree.float-preview").on_attach(bufnr)

        local api = require "nvim-tree.api"
        api.config.mappings.default_on_attach(bufnr)
      end,

      hijack_cursor = true, ---keep cursor on first letter of filename
      disable_netrw = true, ---completely disable netrw
      hijack_unnamed_buffer_when_opening = true, ---open in empty unnamed buffers
      sync_root_with_cwd = true, ---change cwd on `DirChanged`
      reload_on_bufenter = true, ---update on `BufEnter`
      select_prompts = true, ---`vim.ui.select` prompts

      view = {
        cursorline = true,
        side = "right",
        -- number = true,
        -- relativenumber = true,
        signcolumn = "auto",

        width = { padding = 2 },

        float = {
          enable = true,
          open_win_config = {
            relative = "editor",
            border = border,
            width = math.floor(vim.opt.columns:get() * 0.25),
            height = 30,
            row = 1,
            col = 1,
          },
        },
      },

      renderer = {
        group_empty = true,
        full_name = true,
        root_folder_label = function(root_cwd)
          return root_cwd:gsub(os.getenv "USERPROFILE", "~"):gsub("\\", "/") .. "/"
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
          open_win_config = {
            border = border,
            col = 1,
            row = 1,
          },
        },
      },

      trash = { cmd = "trash" },
    }
  end,
}
