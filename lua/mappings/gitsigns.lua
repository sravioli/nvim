-- local gs = package.loaded.gitsigns
local gs = require "gitsigns"

return {
  plugin = true,

  n = {
    -- Navigation through hunks
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
      "Jump to next hunk",
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
      "Jump to prev hunk",
      opts = { expr = true },
    },

    -- Actions
    ["<leader>hs"] = { gs.stage_hunk, "󰊢  Stage hunk" },
    ["<leader>hr"] = { gs.reset_hunk, "󰊢  Reset hunk" },

    ["<leader>hS"] = { gs.stage_buffer, "󰊢  Stage buffer" },
    ["<leader>hu"] = { gs.undo_stage_hunk, "󰊢  Undo stage hunk" },
    ["<leader>hR"] = { gs.reset_buffer, "󰊢  Reset buffer" },
    ["<leader>hp"] = { gs.preview_hunk, "󰊢  Preview hunk" },
    ["<leader>hb"] = {
      function()
        gs.blame_line { full = true }
      end,
      "󰊢  Enable line blame",
    },
    ["<leader>tb"] = {
      gs.toggle_current_line_blame,
      "󰊢  Toggle current line blame",
    },
    ["<leader>hd"] = { gs.diffthis, "󰊢  Diff this" },
    ["<leader>hD"] = {
      function()
        gs.diffthis "~"
      end,
      "󰊢  Diff this",
    },
    ["<leader>td"] = { gs.toggle_deleted, "󰊢  Toggle deleted" },
  },

  v = {
    ["<leader>hs"] = {
      function()
        gs.stage_hunk { vim.fn.line ".", vim.fn.line "v" }
      end,
      "󰊢  Stage hunk",
    },

    ["<leader>hr"] = {
      function()
        gs.reset_hunk { vim.fn.line ".", vim.fn.line "v" }
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
