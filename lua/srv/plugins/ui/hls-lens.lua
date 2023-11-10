return {
  ---Hlsearch Lens for Neovim
  "kevinhwang91/nvim-hlslens",
  event = "CmdlineEnter",
  opts = {
    calm_down = true,
  },
  config = function(_, opts)
    require("scrollbar.handlers.search").setup(opts)
    require("srv.utils.keymaps").load("hls-lens", { noremap = true, silent = true })
  end,
}
