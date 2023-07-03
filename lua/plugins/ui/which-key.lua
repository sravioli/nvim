return {
  ---💥 Create key bindings that stick. WhichKey is a lua plugin for Neovim 0.5
  ---that displays a popup with possible keybindings of the command you started
  ---typing.
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.opt.timeout = true
    vim.opt.timeoutlen = 300
  end,
  opts = {
    window = { border = require("preferences").border },
    layout = {
      height = { min = 4, max = 25 },
      width = { min = 20, max = 50 },
      spacing = 3,
      align = "center",
    },
    key_labels = {
      ---override the label used to display some keys. It doesn't effect WK in any other way.
      ---For example:
      ["<space>"] = "SPC",
      ["<cr>"] = "RET",
      ["<tab>"] = "TAB",
    },
  },
}
