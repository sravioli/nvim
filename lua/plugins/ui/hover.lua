return {
  -- Hover plugin framework for Neovim
  "lewis6991/hover.nvim",
  keys = {
    { "<leader>k", "<cmd>lua require('hover').hover()<CR>", desc = "hover.nvim" },
    {
      "gK",
      "<cmd>lua require('hover').hover_select()<CR>",
      desc = "hover.nvim (select)",
    },
  },
  opts = {
    init = function()
      -- Require providers
      require "hover.providers.lsp"
      -- require "hover.providers.gh"
      -- require "hover.providers.gh_user"
      -- require "hover.providers.jira"
      require "hover.providers.man"
      require "hover.providers.dictionary"
    end,
    preview_opts = { border = require("preferences").border },
  },
}
