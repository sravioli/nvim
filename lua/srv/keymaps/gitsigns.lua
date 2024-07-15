---@module "srv.keymaps.gitsigns"
---@author sravioli
---@license GNU-GPLv3

local Keymap = require "srv.utils.keymap"
local GitsignsKeymaps = Keymap:create() --[[@class Keymap]]

GitsignsKeymaps:add {
  ---Hunk navigation
  {
    "]h",
    function()
      if vim.wo.diff then
        return "]h"
      end
      vim.schedule(function()
        require("gitsigns").next_hunk()
      end)
      return "<Ignore>"
    end,
    desc = "Jump to next hunk",
    icon = "󱋿",
    expr = true,
  },
  {
    "[h",
    function()
      if vim.wo.diff then
        return "[h"
      end
      vim.schedule(function()
        require("gitsigns").prev_hunk()
      end)
      return "<Ignore>"
    end,
    desc = "Jump to prev hunk",
    icon = "󱋿",
    expr = true,
  },

  { "<leader>h", group = "hunk", icon = "󰊢", mode = { "n", "v" } },

  ---Actions
  {
    "<leader>hs",
    function()
      require("gitsigns").stage_hunk()
    end,
    desc = "Stage hunk",
    icon = "󰊢",
  },
  {
    "<leader>hr",
    function()
      require("gitsigns").reset_hunk()
    end,
    desc = "Reset hunk",
    icon = "󰊢",
  },

  {
    "<leader>hS",
    function()
      require("gitsigns").stage_buffer()
    end,
    desc = "Stage buffer",
    icon = "󰊢",
  },
  {
    "<leader>hu",
    function()
      require("gitsigns").undo_stage_hunk()
    end,
    desc = "Undo stage hunk",
    icon = "󰊢",
  },
  {
    "<leader>hR",
    function()
      require("gitsigns").reset_buffer()
    end,
    desc = "Reset buffer",
    icon = "󰊢",
  },
  {
    "<leader>hp",
    function()
      require("gitsigns").preview_hunk()
    end,
    desc = "Preview hunk",
    icon = "󰊢",
  },
  {
    "<leader>hb",
    function()
      require("gitsigns").blame_line { full = true }
    end,
    desc = "Enable line blame",
    icon = "󰊢",
  },
  {
    "<leader>tb",
    function()
      require("gitsigns").toggle_current_line_blame()
    end,
    desc = "Toggle current line blame",
    icon = "󰊢",
  },
  {
    "<leader>hd",
    function()
      require("gitsigns").diffthis()
    end,
    desc = "Diff against index",
    icon = "󰊢",
  },
  {
    "<leader>hD",
    function()
      require("gitsigns").diffthis "~"
    end,
    desc = "Diff against last commit",
    icon = "󰊢",
  },
  {
    "<leader>td",
    function()
      require("gitsigns").toggle_deleted()
    end,
    desc = "Toggle deleted",
    icon = "󰊢",
  },
  {
    "<leader>hs",
    function()
      require("gitsigns").stage_hunk { vim.fn.line ".", vim.fn.line "v" }
    end,
    desc = "Stage hunk",
    icon = "󰊢",
    mode = "v",
  },

  {
    "<leader>hr",
    function()
      require("gitsigns").reset_hunk { vim.fn.line ".", vim.fn.line "v" }
    end,
    desc = "Reset hunk",
    icon = "󰊢",
    mode = "v",
  },

  {
    "ih",
    ":<C-U>Gitsigns select_hunk<CR>",
    desc = "Select hunk",
    icon = "󰊢",
    mode = { "x", "o" },
  },
}

GitsignsKeymaps:inject { noremap = true, silent = true }
GitsignsKeymaps:set_icon_color "green"

return GitsignsKeymaps
