return {
  ---The Refactoring library based off the Refactoring book by Martin Fowler
  "ThePrimeagen/refactoring.nvim",
  keys = {
    {
      "<leader>rr",
      function()
        require("telescope").extensions.refactoring.refactors()
      end,
      desc = "  Code refactor",
      mode = { "n", "x" },
    },
    {
      "<leader>re",
      ":Refactor extract ",
      desc = "  Refactor: generic extract",
      mode = "x",
    },
    {
      "<leader>rf",
      ":Refactor extract_to_file ",
      desc = "  Extract selection to file",
      mode = "x",
    },
    {
      "<leader>rv",
      ":Refactor extract_var ",
      desc = "  Extract selection to variable",
      mode = "x",
    },
    {
      "<leader>ri",
      ":Refactor inline_var",
      desc = "  Replace variables with its value",
      mode = { "n", "x" },
    },
    {
      "<leader>rI",
      ":Refactor inline_func",
      desc = "  Replace function with its value",
      mode = "n",
    },
    {
      "<leader>rb",
      ":Refactor extract_block",
      desc = "  Extract selection to function",
    },
    {
      "<leader>rbf",
      ":Refactor extract_block_to_file",
      desc = "  Extract selection to file",
    },
  },
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "nvim-treesitter/nvim-treesitter" },
  },
  -- init = function() require("telescope").load_extension "refactoring" end,
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
  config = function(_, opts)
    require("refactoring").setup(opts)

    require("srv.utils.fun.lazy").on_load("telescope.nvim", function()
      require("telescope").load_extension "refactoring"
    end)
  end,
}
