return {
  ---Indent guides for Neovim
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  event = "BufReadPost",
  opts = {
    scope = {
      enabled = true,
      include = {
        node_type = { lua = { "return_statement", "table_constructor" } },
      },
    },
  },
}
