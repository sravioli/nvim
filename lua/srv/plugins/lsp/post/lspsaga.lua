return {
  ---improve neovim lsp experience
  "glepnir/lspsaga.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "nvim-treesitter/nvim-treesitter",
  },
  branch = "main",
  event = "LspAttach",
  opts = {
    symbol_in_winbar = {
      enable = true,
      separator = " > ",
    },

    callhierarchy = {},

    code_action = { enable = false },

    diagnostic = { enable = false },

    finder = {
      min_width = 40,
      keys = {
        expand_or_jump = { "o", "<CR>" },
        vsplit = "S",
        split = "s",
        quit = { "q", "<ESC>" },
      },
    },

    lightbulb = { virtual_text = false },

    outline = {
      win_width = 40,
      preview_width = 0.35,
      auto_resize = true,
      -- custom_sort = nil,
      keys = {
        expand_or_jump = { "<CR>", "o" },
      },
    },

    rename = {
      quit = "<Esc>",
    },

    ui = {
      border = require("srv.preferences").border,
      code_action = "󰌵 ",
      incoming = "󰁍 ",
      outgoing = " ",
      lines = { "╰", "├", "│", "─", "╭" },
    },
  },

  config = function(_, opts)
    require("lspsaga").setup(opts)
    require("srv.utils.keymaps").load("lspsaga", { silent = true })
  end,
}
