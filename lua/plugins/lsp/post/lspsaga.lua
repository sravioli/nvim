return {
  -- improve neovim lsp experience
  "glepnir/lspsaga.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "nvim-treesitter/nvim-treesitter",
  },
  branch = "main",
  event = "LspAttach",
  init = function()
    require("utils.fn").mappings.load "lspsaga"
  end,
  opts = {
    outline = {
      win_width = 40,
      preview_width = 0.35,
      auto_resize = true,
      -- custom_sort = nil,
      keys = {
        expand_or_jump = { "<CR>", "o" },
      },
    },

    finder = {
      min_width = 40,
      keys = {
        expand_or_jump = { "o", "<CR>" },
        vsplit = "S",
        split = "s",
        quit = { "q", "<ESC>" },
      },
    },

    code_action = {
      show_server_name = true,
    },

    rename = {
      quit = "<Esc>",
    },

    ui = {
      border = require("preferences").border,
      code_action = "󰌵 ",
      incoming = "󰁍 ",
      outgoing = " ",
      hover = " ",
    },

    symbol_in_winbar = {
      enable = true,
      separator = " > ",
    },
  },
}
