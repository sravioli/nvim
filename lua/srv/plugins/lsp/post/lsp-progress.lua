return {
  ---A performant LSP progress status for Neovim.
  "linrongbin16/lsp-progress.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "LspAttach",
  config = function() require("lsp-progress").setup() end,
}
