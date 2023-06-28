return {
  -- COLORSCHEME --------------------------------------------------------------
  {
    -- NeoVim dark colorscheme inspired by the colors of the famous painting by
    -- Katsushika Hokusai.
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    opts = require "plugins.configs.kanagawa",
    init = function()
      vim.cmd.colorscheme "kanagawa"
    end,
  },

  -- PRE-LSPCONFIG ------------------------------------------------------------
  {
    -- Extension to mason.nvim that makes it easier to use lspconfig with mason.nvim.
    "williamboman/mason-lspconfig.nvim",
    cmd = { "LspInstall", "LspUninstall" },
    opts = require "plugins.configs.mason-lspconfig",
    dependencies = {
      {
        -- Portable package manager for Neovim that runs everywhere Neovim runs.
        -- Easily install and manage LSP servers, DAP servers, linters, and formatters.
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        cmd = {
          "Mason",
          "MasonInstall",
          "MasonUninstall",
          "MasonUninstallAll",
          "MasonLog",
        },
        opts = require "plugins.configs.mason",
      },
    },
  },
  {
    -- Use Neovim as a language server to inject LSP diagnostics, code actions,
    -- and more via Lua.
    "jose-elias-alvarez/null-ls.nvim",
    event = "BufWinEnter",
    config = function()
      require "plugins.configs.null-ls"
    end,
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  -- LSPCONFIG ----------------------------------------------------------------
  {
    -- Quickstart configs for Nvim LSP
    "neovim/nvim-lspconfig",
    event = { "BufWinEnter", "BufRead", "BufNewFile" },
    config = function()
      require "plugins.configs.lsp"
    end,
    dependencies = {
      {
        -- 💻 Neovim setup for init.lua and plugin development with full signature
        -- help, docs and completion for the nvim lua API.
        "folke/neodev.nvim",
        enabled = false,
        opts = require "plugins.configs.neodev",
        ft = "lua",
      },
    },
  },

  -- TREE-SITTER --------------------------------------------------------------
  {
    -- Nvim Treesitter configurations and abstraction layer
    "nvim-treesitter/nvim-treesitter",
    event = "BufWinEnter",
    build = function()
      require("nvim-treesitter.install").update { with_sync = true }
    end,
    config = function()
      require "plugins.configs.tree-sitter"
    end,
  },
  {
    -- Syntax aware text-objects, select, move, swap, and peek support.
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    event = "BufWinEnter",
  },

  -- AUTOCOMPLETION -----------------------------------------------------------
  {
    -- A completion plugin for neovim coded in Lua.
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    config = function()
      require "plugins.configs.cmp"
    end,
    dependencies = {
      -- vscode-like pictograms for neovim lsp completion items
      { "onsails/lspkind.nvim" },
      { "L3MON4D3/LuaSnip" },
      {
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "lukas-reineke/cmp-rg",
        "FelipeLema/cmp-async-path",
        "chrisgrieser/cmp-nerdfont",
        { "doxnit/cmp-luasnip-choice", config = true },
        {
          "paopaol/cmp-doxygen",
          dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-treesitter/nvim-treesitter-textobjects",
          },
        },
      },
    },
  },
  {
    -- Snippet Engine for Neovim written in Lua.
    "L3MON4D3/LuaSnip",
    build = "make install_jsregexp",
    config = function()
      require "plugins.configs.lua-snip"
    end,
    dependencies = { "rafamadriz/friendly-snippets" },
  },

  -- UI COMPONENTS ------------------------------------------------------------
  {
    -- The neovim tabline plugin.
    "romgrk/barbar.nvim",
    event = "BufAdd",
    init = function()
      vim.g.barbar_auto_setup = false
    end,
    opts = require "plugins.configs.barbar",
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
      { "lewis6991/gitsigns.nvim" },
      { "rebelot/kanagawa.nvim" },
    },
  },
  {
    -- A blazing fast and easy to configure neovim statusline plugin written in
    -- pure lua.
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = require "plugins.configs.lualine",
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
      { "rebelot/kanagawa.nvim" },
    },
  },
  {
    -- Neovim plugin to manage the file system and other tree like structures.
    "nvim-neo-tree/neo-tree.nvim",
    cmd = "Neotree",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
  },
  {
    -- lua `fork` of vim-web-devicons for neovim
    "nvim-tree/nvim-web-devicons",
    config = true,
  },
}
