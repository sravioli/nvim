---@class Keymap
local prefs = require "utils.prefs" --[[@class Preferences]]

return {
  -- {{{1 gitsigns.nvim: git integration for buffers
  {
    "lewis6991/gitsigns.nvim",
    cond = not vim.g.vscode,
    event = require("utils.events").LazyFile,
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
        local gitsigns = require "gitsigns"

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map("n", "]c", function()
          if vim.wo.diff then
            vim.cmd.normal { "]c", bang = true }
          else
            gitsigns.nav_hunk "next"
          end
        end)

        map("n", "[c", function()
          if vim.wo.diff then
            vim.cmd.normal { "[c", bang = true }
          else
            gitsigns.nav_hunk "prev"
          end
        end)

        -- Actions
        map("n", "<leader>hs", gitsigns.stage_hunk)
        map("n", "<leader>hr", gitsigns.reset_hunk)

        map("v", "<leader>hs", function()
          gitsigns.stage_hunk { vim.fn.line ".", vim.fn.line "v" }
        end)

        map("v", "<leader>hr", function()
          gitsigns.reset_hunk { vim.fn.line ".", vim.fn.line "v" }
        end)

        map("n", "<leader>hS", gitsigns.stage_buffer)
        map("n", "<leader>hR", gitsigns.reset_buffer)
        map("n", "<leader>hp", gitsigns.preview_hunk)
        map("n", "<leader>hi", gitsigns.preview_hunk_inline)

        map("n", "<leader>hb", function()
          gitsigns.blame_line { full = true }
        end)

        map("n", "<leader>hd", gitsigns.diffthis)

        map("n", "<leader>hD", function()
          gitsigns.diffthis "~"
        end)

        map("n", "<leader>hQ", function()
          gitsigns.setqflist "all"
        end)
        map("n", "<leader>hq", gitsigns.setqflist)

        -- Toggles
        map("n", "<leader>tb", gitsigns.toggle_current_line_blame)
        map("n", "<leader>tw", gitsigns.toggle_word_diff)

        -- Text object
        map({ "o", "x" }, "ih", gitsigns.select_hunk)
      end,
    },
  }, -- }}}

  -- {{{1 diffview.nvim: Single tabpage interface for easily cycling through diffs for
  -- all modified files for any git rev.
  {
    "sindrets/diffview.nvim",
    cond = not vim.g.vscode,
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
