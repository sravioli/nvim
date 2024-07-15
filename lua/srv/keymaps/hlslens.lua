---@module "srv.keymaps.hlslens"
---@author sravioli
---@license GNU-GPLv3

local Keymap = require "srv.utils.keymap"
local HlslensKeymaps = Keymap:create() --[[@class Keymap]]

HlslensKeymaps:add {
  { "n", "nzzzv<cmd>lua require('hlslens').start()<CR>", desc = "Next", icon = "󰒭" },
  { "N", "Nzzzv<cmd>lua require('hlslens').start()<CR>", desc = "Prev", icon = "󰒮" },

  {
    "*",
    "*zzzv<cmd>lua require('hlslens').start()<CR>",
    desc = "Search forward under cursor",
    icon = "",
  },
  {
    "#",
    "#zzzv<cmd>lua require('hlslens').start()<CR>",
    desc = "Search backwards under cursor",
    icon = "",
  },
  {
    "g*",
    "g*zzzv<cmd>lua require('hlslens').start()<CR>",
    desc = "Search forward under cursor (not whole word)",
    icon = "",
  },
  {
    "g#",
    "g#zzzv<cmd>lua require('hlslens').start()<CR>",
    desc = "Search backwards under cursor (not whole word)",
    icon = "",
  },

  {
    "<leader>L",
    function()
      vim.schedule(function()
        if require("hlslens").exportLastSearchToQuickfix() then
          vim.cmd "cwindow"
        end
      end)
      return ":nohlsearch<CR>"
    end,
    desc = "Export search results to quickfix",
    icon = "󰈇",
    expr = true,
    mode = { "n", "x" },
  },
}

HlslensKeymaps:wait_plugin_load "nvim-hlslens"
HlslensKeymaps:inject { noremap = true, silent = true }
HlslensKeymaps:set_icon_color "yellow"

return HlslensKeymaps
