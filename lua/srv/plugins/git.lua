local fun = require "srv.utils.fun"
local preferences = require "srv.preferences"

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
      preview_config = { border = preferences.border },

      on_attach = function(bufnr)
        fun.keymaps.load("gitsigns", { buffer = bufnr })
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
            "<Cmd>Neogit commit",
            { desc = "Commit staged changes" },
          },
          {
            "n",
            "ca",
            "<Cmd>Neogit commit --amend",
            { desc = "Amend the last commit" },
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
