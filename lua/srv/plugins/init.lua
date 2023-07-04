local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

local spec = {
  { import = "srv.plugins.ui" },
  { import = "srv.plugins.dap" },
  { import = "srv.plugins.editor" },
  { import = "srv.plugins.treesitter" },
  { import = "srv.plugins.lsp.pre" },
  { import = "srv.plugins.lsp.post" },
  { import = "srv.plugins.lsp.lspconfig" },
  { import = "srv.plugins.autocompletion" },
}

local config = {
  defaults = { lazy = true },
  install = { colorscheme = { "kanagawa" } },

  ui = {
    border = require("srv.preferences").border,
    icons = {
      ft = "",
      lazy = "󰂠 ",
      loaded = "",
      not_loaded = "",
    },
  },

  checker = { enabled = true, notify = false },
  change_detection = { enabled = false },

  performance = {
    rtp = {
      disabled_plugins = {
        "2html_plugin",
        "tohtml",
        "getscript",
        "getscriptPlugin",
        "gzip",
        "logipat",
        "netrw",
        "netrwPlugin",
        "netrwSettings",
        "netrwFileHandlers",
        "matchit",
        "tar",
        "tarPlugin",
        "rrhelper",
        "spellfile_plugin",
        "vimball",
        "vimballPlugin",
        "zip",
        "zipPlugin",
        "tutor",
        "rplugin",
        "syntax",
        "synmenu",
        "optwin",
        "compiler",
        "bugreport",
        "ftplugin",
        "editorconfig",
      },
    },
  },
}

require("lazy").setup(spec, config)
