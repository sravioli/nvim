---@module "srv.keymaps.lspsaga"
---@author sravioli
---@license GNU-GPLv3

local Keymap = require "srv.utils.keymap"
local SagaKeymaps = Keymap:create() --[[@class Keymap]]

SagaKeymaps:add {
  { "<leader>fd", "<cmd>Lspsaga finder<CR>", desc = "Find definition", icon = " " },
  {
    "<leader>ca",
    "<cmd>Lspsaga code_action<CR>",
    desc = "Code actions",
    icon = "󱐋",
    mode = { "n", "v" },
  },
  { "<leader>cr", "<cmd>Lspsaga rename<CR>", desc = "Code rename", icon = "󰑕" },
  { "gd", "<cmd>Lspsaga goto_definition<CR>", desc = "Definition", icon = "󰞘" },
  {
    "gT",
    "<cmd>Lspsaga goto_type_definition<CR>",
    desc = "Type definition",
    icon = "",
  },

  {
    "gpd",
    "<cmd>Lspsaga peek_definition<CR>",
    desc = "Lspsaga peek definition",
    icon = "",
  },
  {
    "gpt",
    "<cmd>Lspsaga peek_type_definition<CR>",
    desc = "Type definition (peek)",
    icon = "",
  },

  {
    "<Leader>ci",
    "<cmd>Lspsaga incoming_calls<CR>",
    desc = "Incoming call hierarchy",
    icon = "",
  },
  {
    "<Leader>co",
    "<cmd>Lspsaga outgoing_calls<CR>",
    desc = "Outgoing call hierarchy",
    icon = "",
  },

  { "<leader>o", "<cmd>Lspsaga outline<CR>", desc = "Outline", icon = "󰧮" },
}

SagaKeymaps:wait_plugin_load "lspsaga.nvim"
SagaKeymaps:inject { remap = true, silent = true }
SagaKeymaps:set_icon_color "red"

return SagaKeymaps
