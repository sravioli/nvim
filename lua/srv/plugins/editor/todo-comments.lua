return {
  ---✅ Highlight, list and search todo comments in your projects
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  event = "BufReadPost",
  keys = {
    {
      "]t",
      function()
        require("todo-comments").jump_next()
      end,
      desc = "  Next todo comment",
    },
    {
      "[t",
      function()
        require("todo-comments").jump_prev()
      end,
      desc = "   Previous todo comment",
    },
    { "<leader>xt", "<cmd>TodoTrouble<CR>", desc = "  Todo (Trouble)" },
    {
      "<leader>xT",
      "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<CR>",
      desc = "  Todo/Fix/Fixme (Trouble)",
    },
    { "<leader>st", "<cmd>TodoTelescope<CR>", desc = "  Todo" },
    {
      "<leader>sT",
      "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<CR>",
      desc = "  Todo/Fix/Fixme",
    },
  },
  config = true,
}