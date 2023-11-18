return {
  ---Quickstart configs for Nvim LSP
  "neovim/nvim-lspconfig",
  event = { "BufWinEnter", "BufRead", "BufNewFile" },
  config = function() require "srv.plugins.lsp.servers" end,
  dependencies = {
    {
      ---💻 Neovim setup for init.lua and plugin development with full signature help, docs
      ---and completion for the nvim lua API.
      "folke/neodev.nvim",
      enabled = true,
      ft = "lua",
      opts = {
        library = {
          plugins = { "nvim-dap-ui" },
        },
      },
    },
  },
}
