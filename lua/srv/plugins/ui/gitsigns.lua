return {
  ---Git integration for buffers
  "lewis6991/gitsigns.nvim",
  event = require("srv.utils.event").events.LazyFile,
  opts = {
    signs = {
      add = { text = "│" },
      change = { text = "│" },
      delete = { text = "󰍵" },
      topdelete = { text = "‾" },
      changedelete = { text = "~" },
      untracked = { text = "│" },
    },
    preview_config = { border = require("srv.preferences").border },

    on_attach = function(bufnr)
      require("srv.utils.keymaps").load("gitsigns", { buffer = bufnr })
    end,
  },

  -- config = function(_, opts)
  --   require("gitsigns").setup(opts)
  --   require("srv.utils.keymaps").load("gitsigns", { buffer = true })
  -- end,
}
