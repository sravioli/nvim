return {
  ---The Refactoring library based off the Refactoring book by Martin Fowler
  "ThePrimeagen/refactoring.nvim",
  keys = {
    {
      "<leader>rr",
      function() require("telescope").extensions.refactoring.refactors() end,
      desc = "  Code refactor",
      mode = { "n", "x" },
    },
    { "<leader>re", ":Refactor extract ", mode = "x" },
    { "<leader>rf", ":Refactor extract_to_file ", mode = "x" },
    { "<leader>rv", ":Refactor extract_var ", mode = "x" },
    { "<leader>ri", ":Refactor inline_var", mode = { "n", "x" } },
    { "<leader>rI", ":Refactor inline_func", mode = "n" },
    { "<leader>rb", ":Refactor extract_block" },
    { "<leader>rbf", ":Refactor extract_block_to_file" },
  },
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "nvim-treesitter/nvim-treesitter" },
  },
  init = function() require("telescope").load_extension "refactoring" end,
  opts = {
    -- prompt for return type
    prompt_func_return_type = {
      go = true,
      cpp = true,
      c = true,
      java = true,
    },
    -- prompt for function parameters
    prompt_func_param_type = {
      go = true,
      cpp = true,
      c = true,
      java = true,
    },
    printf_statements = {},
    print_var_statements = {},
  },
}
