return {
  -- ✅ Highlight, list and search todo comments in your projects
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  event = "VeryLazy",
  init = function()
    require("utils.fn").load_mappings("todo_comments", {})
  end,
  config = true,
}
