local _border = require("utils.prefs").border
local _border_chars = require("utils.prefs").border_chars

return {
  {
    "dgagn/diagflow.nvim",
    opts = {
      show_borders = true,
      border_chars = _border_chars,
    },
  },

  {
    "mason-org/mason.nvim",
    opts = {
      ui = {
        border = _border,
      },
    },
  },
  {
    "folke/noice.nvim",
    opts = {
      presets = {
        lsp_doc_border = true,
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      diagnostics = {
        float = {
          border = _border,
        },
      },
    },
  },
}
