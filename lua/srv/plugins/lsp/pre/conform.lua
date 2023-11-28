return {
  ---Lightweight yet powerful formatter plugin for Neovim
  "stevearc/conform.nvim",
  enabled = false,
  event = require("srv.utils.event").events.LazyFile,
  cmd = "ConformInfo",
  keys = {
    {
      "<leader>cf",
      function()
        require("conform").format { async = true, lsp_fallback = true }
      end,
      mode = "",
      desc = "󰉢  Format buffer",
    },
  },
  init = function()
    -- If you want the formatexpr, here is the place to set it
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
    },

    format_on_save = { timeout_ms = 500, lsp_fallback = true },
  },
}
