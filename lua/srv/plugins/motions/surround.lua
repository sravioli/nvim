return {
  {
    ---Add/change/delete surrounding delimiter pairs with ease. Written with ❤️ in Lua.
    "kylechui/nvim-surround",
    -- tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = true,
    event = "BufReadPost",
  },
  {
    ---🤗 A Neovim plugin which acts as a helper or training aid for nvim-surround
    "roobert/surround-ui.nvim",
    event = "BufReadPost",
    dependencies = {
      { "kylechui/nvim-surround" },
      { "folke/which-key.nvim" },
    },
    config = function()
      require("surround-ui").setup {
        root_key = "S",
      }
    end,
  },
}
