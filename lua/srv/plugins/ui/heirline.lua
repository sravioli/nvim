return {
  ---Heirline.nvim is a no-nonsense Neovim Statusline plugin designed around recursive
  ---inheritance to be exceptionally fast and versatile.
  "rebelot/heirline.nvim",
  dependencies = {
    { "rebelot/kanagawa.nvim" },
    { "nvim-tree/nvim-web-devicons" },
  },
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

    vim.o.laststatus = vim.g.heirline_lastatus
    return {
      statusline = require "srv.utils.heirline.statusline",
    }
  end,
}
