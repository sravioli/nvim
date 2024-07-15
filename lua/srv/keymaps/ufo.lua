---@module "srv.keymaps.ufo"
---@author sravioli
---@license GNU-GPLv3

local Keymap = require "srv.utils.keymap"
local UfoKeymaps = Keymap:create() --[[@class Keymap]]

UfoKeymaps:add {
  {
    "zR",
    function()
      require("ufo").openAllFolds()
    end,
    desc = "Open all folds",
    icon = "󱃄",
  },
  {
    "zM",
    function()
      require("ufo").closeAllFolds()
    end,
    desc = "Close all folds",
    icon = "󱃄",
  },
  {
    "zr",
    function()
      require("ufo").openFoldsExceptKinds()
    end,
    desc = "Open all folds except kinds",
    icon = "󱃄",
  },
  {
    "zm",
    function()
      require("ufo").closeFoldsWith()
    end,
    desc = "Close all folds with",
    icon = "󱃄",
  },
  {
    "zk",
    function()
      if not require("ufo").peekFoldedLinesUnderCursor() then
        vim.lsp.buf.hover()
      end
    end,
    desc = "Preview fold",
    icon = "󱃄",
  },
}

UfoKeymaps:wait_plugin_load "nvim-ufo"
UfoKeymaps:set_icon_color "green"

return UfoKeymaps
