return {
  { ---Other plugins
    { "L3MON4D3/LuaSnip" }, ---Snippet Engine for Neovim written in Lua.
    { "onsails/lspkind.nvim" }, ---vscode-like pictograms for neovim lsp completion items
    { "windwp/nvim-autopairs" }, ---autopairs for neovim written by lua
  },
  { ---Autocompletion sources
    { ---Snippets
      { "saadparwaiz1/cmp_luasnip" }, ---luasnip completion source for nvim-cmp
      -- { "doxnit/cmp-luasnip-choice", config = true }, ---Luasnip choice node completion source for nvim-cmp
    },
    { ---LSP
      { "hrsh7th/cmp-nvim-lsp" }, ---nvim-cmp source for neovim builtin LSP client
      { "hrsh7th/cmp-nvim-lsp-document-symbol" }, ---nvim-cmp source for textDocument/documentSymbol via nvim-lsp.
      { "hrsh7th/cmp-nvim-lsp-signature-help" }, ---cmp-nvim-lsp-signature-help
      { "hrsh7th/cmp-nvim-lua" }, ---nvim-cmp source for nvim lua
    },
    { ---Buffer/Vim-builtin functionality
      { "hrsh7th/cmp-buffer" }, ---nvim-cmp source for buffer words
      { "amarakon/nvim-cmp-buffer-lines" }, ---nvim-cmp completion source for buffer lines
      { "hrsh7th/cmp-calc" }, ---nvim-cmp source for math calculation
      { "PhilRunninger/cmp-rpncalc" }, ---nvim-cmp source for math calculations using Reverse Polish Notation
      { "dmitmel/cmp-digraphs" }, ---A nvim-cmp source for completing digraphs.
    },
    { ---Filesystem paths
      { "FelipeLema/cmp-async-path" }, ---nvim-cmp source for path (async version)
    },
    { ---Git
      { "davidsierradz/cmp-conventionalcommits" }, ---nvim-cmp source for autocompleting git commits with conventional commits types
    },
    { ---Command line
      { "hrsh7th/cmp-cmdline" }, ---nvim-cmp source for vim's cmdline
      { "dmitmel/cmp-cmdline-history" }, ---Source for nvim-cmp which reads results from command-line or search histories
    },
    { ---Fuzzy finding
      { "lukas-reineke/cmp-rg" }, ---ripgrep source for nvim-cmp
    },
    { ---Miscellaneous
      { "tzachar/cmp-tabnine" }, ---TabNine plugin for hrsh7th/nvim-cmp
      { ---neovim completion for doxygen use in nvim-cmp
        "paopaol/cmp-doxygen",
        dependencies = {
          "nvim-treesitter/nvim-treesitter",
          "nvim-treesitter/nvim-treesitter-textobjects",
        },
      },
      { "hrsh7th/cmp-emoji" }, ---nvim-cmp source for emoji
      { "chrisgrieser/cmp-nerdfont" }, ---nvim-cmp source for nerdfont icons
      { "kdheepak/cmp-latex-symbols" }, ---Add latex symbol support for nvim-cmp.
      { "ray-x/cmp-treesitter" }, ---cmp source for treesitter
      { ---Just ask an otter! 🦦
        "jmbuhr/otter.nvim",
        dependencies = {
          "neovim/nvim-lspconfig",
          "nvim-treesitter/nvim-treesitter",
        },
        config = function()
          require("otter.config").setup()
        end,
      },
    },
  },
}
