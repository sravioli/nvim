return {
  {
    -- NeoVim dark colorscheme inspired by the colors of the famous painting by
    -- Katsushika Hokusai.
    "rebelot/kanagawa.nvim",
    name = "kanagawa",
    lazy = false,
    priority = 1000,
    opts = require "plugins.configs.kanagawa",
    init = function()
      vim.cmd.colorscheme "kanagawa"
    end,
  },
  {
    -- 💻 Neovim setup for init.lua and plugin development with full signature
    -- help, docs and completion for the nvim lua API.
    "folke/neodev.nvim",
    opts = require "plugins.configs.neodev",
    ft = "lua",
  },
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
  {
    -- Extension to mason.nvim that makes it easier to use lspconfig with mason.nvim.
    "williamboman/mason-lspconfig.nvim",
    cmd = { "LspInstall", "LspUninstall" },
    opts = require "plugins.configs.mason-lspconfig",
    dependencies = { "williamboman/mason.nvim" },
  },
  -- {},
}
