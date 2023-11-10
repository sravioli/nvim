return {
  ---Extensible Neovim Scrollbar
  "petertriho/nvim-scrollbar",
  dependencies = {
    { "kevinhwang91/nvim-hlslens" },
  },

  event = "BufWinEnter",
  opts = {
    hide_if_all_visible = true,
    handle = {
      blend = 0,
      highlight = "NormalDark",
    },

    handlers = {
      gitsigns = false,
      search = true,
    },
  },
}
