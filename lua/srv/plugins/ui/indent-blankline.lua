return {
  ---Indent guides for Neovim
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  event = require("srv.utils.event").events.LazyFile,
  opts = {
    scope = {
      enabled = true,
      include = {
        node_type = { lua = { "return_statement", "table_constructor" } },
      },
    },
  },
}
