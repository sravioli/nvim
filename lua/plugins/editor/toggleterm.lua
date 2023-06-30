return {
  -- A neovim lua plugin to help easily manage multiple terminal windows
  "akinsho/toggleterm.nvim",
  event = "VeryLazy",
  version = "*",
  init = function()
    require("utils.fn").load_mappings "toggleterm"
  end,
  opts = {
    size = function(term)
      if term.direction == "horizontal" then
        return 15
      elseif term.direction == "vertical" then
        return vim.o.columns * 0.4
      end
    end,
    direction = "float",
    shell = function()
      local shell = { win = "pwsh.exe", lnx = "bash" }
      return shell[require("utils.fn").get_os()]
    end,
    float_opts = {
      border = require("preferences").border,
    },
    highlights = {
      FloatBorder = {
        link = "FloatBorder",
      },
    },
  },
}
