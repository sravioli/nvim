return {
  ---Extensible Neovim Scrollbar
  "petertriho/nvim-scrollbar",
  dependencies = {
    { "kevinhwang91/nvim-hlslens" },
  },
  event = "BufWinEnter",
  opts = function()
    local theme = require("kanagawa.colors").setup().theme
    return {
      hide_if_all_visible = true,
      handle = {
        blend = 0,
        color = theme.ui.bg_m3,
      },

      marks = {
        Search = { color = theme.ui.bg_search },
      },

      handlers = {
        gitsigns = false,
        search = true,
      },
    }
  end,
}
