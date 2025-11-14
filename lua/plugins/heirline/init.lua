return {
  { "nvim-lualine/lualine.nvim", enabled = false },

  {
    "rebelot/heirline.nvim",
    lazy = true,
    dependencies = {
      "rebelot/kanagawa.nvim",
      "neovim/nvim-lspconfig",
    },
    cond = not vim.g.vscode,
    enabled = not vim.g.vscode,
    event = "VeryLazy",
    init = function()
      vim.g.heirline_lastatus = vim.o.laststatus
      if vim.fn.argc(-1) > 0 then
        vim.o.statusline = " " -- set an empty statusline till lualine loads
      else
        vim.o.laststatus = 0 -- hide the statusline on the starter page
      end
    end,
    opts = function()
      if not pcall(require, "heirline") then
        return
      end

      vim.opt_global.laststatus = vim.g.heirline_lastatus
      local statusline = require "plugins.heirline.component.statusline"
      return {
        statusline = statusline,
      }
    end,
  },
}

-- vim: fdm=marker
