local fun = require "utils.fun"

return {
  "nvim-telescope/telescope.nvim",
  keys = {
    {
      "<C-p>",
      function()
        fun.telescope.fd()
      end,
      desc = "Find files",
    },
  },
  opts = {
    defaults = {
      mappings = {
        i = {
          ["<C-j>"] = {
            require("telescope.actions").move_selection_next,
            type = "action",
            opts = { nowait = true, silent = true },
          },

          ["<C-k>"] = {
            require("telescope.actions").move_selection_previous,
            type = "action",
            opts = { nowait = true, silent = true },
          },

          ["<M-p>"] = require("telescope.actions.layout").toggle_preview,

          ["<C-n>"] = require("telescope.actions").cycle_history_next,
          ["<C-p>"] = require("telescope.actions").cycle_history_prev,
        },

        n = {
          ["q"] = require("telescope.actions").close,
          ["<M-p>"] = require("telescope.actions.layout").toggle_preview,
        },
      },
    },
  },
}
