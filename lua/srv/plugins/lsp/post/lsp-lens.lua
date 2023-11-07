return {
  ---Neovim plugin for displaying references and definition infos upon functions like JB's IDEA.
  "VidocqH/lsp-lens.nvim",
  event = "LspAttach",
  opts = {
    enable = true,
    include_declaration = true, -- Reference include declaration
    sections = { -- Enable/Disable specific request
      definition = true,
      references = true,
      implementation = true,
    },
  },
}
