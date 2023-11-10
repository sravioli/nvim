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
    window = { border = require("srv.preferences").border },
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
    defaults = {
      mode = { "n", "v" },
      ["g"] = { name = "+goto" },
      ["]"] = { name = "+next" },
      ["["] = { name = "+prev" },
      ["<leader>b"] = { name = "+buffer" },
      ["<leader>c"] = { name = "+code" },
      ["<leader>cg"] = { name = "+generate" },
      ["<leader>f"] = { name = "+file/find" },
      ["<leader>g"] = { name = "+git" },
      ["<leader>h"] = { name = "+hunks" },
      ["<leader>s"] = { name = "+search" },
      ["<leader>x"] = { name = "+diagnostics/quickfix" },
      ["<leader>r"] = { name = "+refactor" },
      ["<leader>t"] = { name = "+toggle" },
      ["<leader>d"] = { name = "+debug" },
      ["<leader>da"] = { name = "+adapters" },
    },
  },
  config = function(_, opts)
    local wk = require "which-key"
    wk.setup(opts)
    wk.register(opts.defaults)
  end,
}
