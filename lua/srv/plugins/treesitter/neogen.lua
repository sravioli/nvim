return {
  ---A better annotation generator. Supports multiple languages and annotation
  ---conventions.
  "danymat/neogen",
  dependencies = { { "nvim-treesitter/nvim-treesitter" } },
  version = "*",
  keys = {
    {
      "<leader>cgg",
      function() require("neogen").generate() end,
      desc = "  Generate annotation (auto)",
    },
    {
      "<leader>cgf",
      function() require("neogen").generate { type = "func" } end,
      desc = "  Generate function annotation",
    },
    {
      "<leader>cgc",
      function() require("neogen").generate { type = "class" } end,
      desc = "  Generate class annotation",
    },
    {
      "<leader>cgt",
      function() require("neogen").generate { type = "type" } end,
      desc = "  Generate type annotation",
    },
    {
      "<leader>cgF",
      function() require("neogen").generate { type = "file" } end,
      desc = "  Generate file annotation",
    },
  },
  opts = {
    snippet_engine = "luasnip",
    languages = {
      lua = { template = { annotation_convention = "emmylua" } },
    },
  },
}
