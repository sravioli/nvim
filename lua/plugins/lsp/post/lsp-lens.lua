return {
  ---Neovim plugin for displaying references and difinition infos upon functions
  ---like JB's IDEA.
  "VidocqH/lsp-lens.nvim",
  event = "LspAttach",
  opts = {
    enable = true,
    include_declaration = false, -- Reference include declaration
    sections = { -- Enable/Disable specific request
      definition = true,
      references = true,
      implementation = true,
    },
  },
}
