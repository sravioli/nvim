return {
  -- A VS Code like winbar for Neovim
  "utilyre/barbecue.nvim",
  enabled = true,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    {
      -- Simple winbar/statusline plugin that shows your current code context
      "SmiteshP/nvim-navic",
      dependencies = "neovim/nvim-lspconfig",
      config = true,
    },
  },
  config = function()
    require("barbecue").setup {
      attach_navic = false,
      create_autocmd = false,
    }
  end,
}
