---@class Keymap
local Keymaps = require "srv.keymaps"
local prefs = require "srv.preferences" --[[@class Preferences]]

return {
  -- {{{1 gitsigns.nvim: git integration for buffers
  {
    "lewis6991/gitsigns.nvim",
    event = require("srv.utils.events").LazyFile,
    opts = {
      signs = {
        add = { text = "│" },
        change = { text = "│" },
        delete = { text = "󰍵" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
        untracked = { text = "│" },
      },
      preview_config = { border = prefs.border },

      on_attach = function(bufnr)
        local keys = Keymaps.load "gitsigns"--[[@class Keymap]]
        keys:inject { buffer = bufnr }
        keys:register()
      end,
    },
  }, -- }}}

  -- {{{1 diffview.nvim: Single tabpage interface for easily cycling through diffs for
  -- all modified files for any git rev.
  {
    "sindrets/diffview.nvim",
    dependencies = {
      -- {{{2 neogit: An interactive and powerful Git interface for Neovim, inspired by Magit
      {
        "NeogitOrg/neogit",
        dependencies = {
          "nvim-lua/plenary.nvim",
          "nvim-telescope/telescope.nvim",
        },
        config = true,
      }, -- }}}
    },
    cmd = {
      "DiffviewOpen",
      "DiffviewClose",
      "DiffviewToggleFiles",
      "DiffviewFocusFiles",
      "DiffviewRefresh",
      "DiffviewFileHistory",
    },
    opts = {
      keymaps = {
        file_panel = {
          {
            "n",
            "cc",
            "<Cmd>Neogit commit<CR>",
            { desc = "Commit staged changes" },
          },
          {
            "n",
            "c<space>",
            ":Neogit commit",
            { desc = 'Populate command line with ":Git commit "' },
          },
        },
      },
    },
  }, -- }}}
}
