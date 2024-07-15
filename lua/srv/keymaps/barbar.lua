---@module "srv.keymaps.barbar"
---@author sravioli
---@license GNU-GPLv3

local Keymap = require "srv.utils.keymap"
local BarbarKeymaps = Keymap:create() --[[@class Keymap]]

BarbarKeymaps:add {
  { "<S-Tab>", "<cmd>BufferPrevious<CR>", desc = "Next", icon = "󰒭" },
  { "<Tab>", "<cmd>BufferNext<CR>", desc = "Prev", icon = "󰒮" },

  ---Re-order to previous/next
  { "<leader>bh", "<cmd>BufferMovePrevious<CR>", desc = "Swap w/ left", icon = "🠈" },
  { "<leader>bl", "<cmd>BufferMoveNext<CR>", desc = "Swap w/ right", icon = "🠊" },

  ---Goto buffer in position...
  { "<leader>b1", "<cmd>BufferGoto 1<CR>", desc = "Jump to buffer 1", icon = "󰎤" },
  { "<leader>b2", "<cmd>BufferGoto 2<CR>", desc = "Jump to buffer 2", icon = "󰎧" },
  { "<leader>b3", "<cmd>BufferGoto 3<CR>", desc = "Jump to buffer 3", icon = "󰎪" },
  { "<leader>b4", "<cmd>BufferGoto 4<CR>", desc = "Jump to buffer 4", icon = "󰎭" },
  { "<leader>b5", "<cmd>BufferGoto 5<CR>", desc = "Jump to buffer 5", icon = "󰎱" },
  { "<leader>b6", "<cmd>BufferGoto 6<CR>", desc = "Jump to buffer 6", icon = "󰎳" },
  { "<leader>b7", "<cmd>BufferGoto 7<CR>", desc = "Jump to buffer 7", icon = "󰎶" },
  { "<leader>b8", "<cmd>BufferGoto 8<CR>", desc = "Jump to buffer 8", icon = "󰎹" },
  { "<leader>b9", "<cmd>BufferGoto 9<CR>", desc = "Jump to buffer 9", icon = "󰎼" },
  { "<leader>b0", "<cmd>BufferLast<CR>", desc = "Jump to last", icon = "󰘁" },

  ---Pin/unpin buffer
  { "<leader>bP", "<cmd>BufferPin<CR>", desc = "Pin", icon = "" },

  ---Close buffer
  { "<leader>bx", "<cmd>BufferClose<CR>", desc = "Close", icon = "" },
  { "<leader>bX", group = "+close options", icon = "" },
  {
    "<leader>bXc",
    "<cmd>BufferCloseAllButCurrent<CR>",
    desc = "Close all buffers except current",
    icon = "",
  },
  {
    "<leader>bXp",
    "<cmd>BufferCloseAllButPinned<CR>",
    desc = "Close all buffers except pinned",
    icon = "",
  },
  {
    "<leader>bXC",
    "<cmd>BufferCloseAllButCurrentOrPinned<CR>",
    desc = "Close all buffers except current/pinned",
    icon = "",
  },
  {
    "<leader>bXl",
    "<cmd>BufferCloseBuffersLeft<CR>",
    desc = "Close all buffers to the left",
    icon = "",
  },
  {
    "<leader>bXr",
    "<cmd>BufferCloseBuffersRight<CR>",
    desc = "Close all buffers to the right",
    icon = "",
  },

  ---Wipeout buffer
  ---                <cmd>BufferWipeout
  ---Close commands
  ---                <cmd>BufferCloseAllButCurrent
  ---                <cmd>BufferCloseAllButPinned
  ---                <cmd>BufferCloseAllButCurrentOrPinned
  ---                <cmd>BufferCloseBuffersLeft
  ---                <cmd>BufferCloseBuffersRight
  ---Magic buffer-picking mode
  { "<leader>bp", "<cmd>BufferPick<CR>", desc = "Pick buffer", icon = "󰢷" },

  ---Sort automatically by...
  {
    "<leader>bb",
    "<cmd>BufferOrderByBufferNumber<CR>",
    desc = "Re-order buffers by number",
    icon = "",
  },
  {
    "<leader>bd",
    "<cmd>BufferOrderByDirectory<CR>",
    desc = "Re-order buffers by directory",
    icon = "󰒼",
  },
  {
    "<leader>bL",
    "<cmd>BufferOrderByLanguage<CR>",
    desc = "Re-order buffers by language",
    icon = "",
  },
  {
    "<leader>bw",
    "<cmd>BufferOrderByWindowNumber<CR>",
    desc = "Re-order buffers by window number",
    icon = "󰫒",
  },

  ---Other:
  ---:BarbarEnable - enables barbar (enabled by default)
  ---:BarbarDisable - very bad command, should never be used
}

BarbarKeymaps:wait_plugin_load "barbar"
BarbarKeymaps:inject { noremap = true, silent = true }
BarbarKeymaps:set_icon_color "azure"

return BarbarKeymaps
