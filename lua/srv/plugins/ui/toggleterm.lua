return {
  ---A neovim lua plugin to help easily manage multiple terminal windows
  "akinsho/toggleterm.nvim",
  keys = {
    {
      "<M-i>",
      "<cmd>ToggleTerm direction=float<CR>",
      desc = "  Toggle floating terminal",
      mode = { "n", "t" },
    },
    {
      "<M-h>",
      "<cmd>ToggleTerm direction=horizontal<CR>",
      desc = "  Toggle horizontal terminal",
      mode = { "n", "t" },
    },
    {
      "<M-v>",
      "<cmd>ToggleTerm direction=vertical<CR>",
      desc = "  Toggle vertical terminal",
      mode = { "n", "t" },
    },
  },
  version = "*",
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
      return shell[require("srv.utils.fn").get_os()]
    end,
    float_opts = {
      border = require("srv.preferences").border,
      width = math.floor(
        vim.api.nvim_win_get_width(vim.api.nvim_get_current_win()) * 0.85
      ),
      height = math.floor(
        vim.api.nvim_win_get_height(vim.api.nvim_get_current_win()) * 0.85
      ),
    },
    highlights = {
      FloatBorder = {
        link = "FloatBorder",
      },
    },
  },
}
