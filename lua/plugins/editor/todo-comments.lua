return {
  ---✅ Highlight, list and search todo comments in your projects
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  event = "BufReadPost",
  init = function()
    require("utils.fn").mappings.load "todo_comments"
  end,
  config = true,
}
