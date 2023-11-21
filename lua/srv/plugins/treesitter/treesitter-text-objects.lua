return {
  ---Syntax aware text-objects, select, move, swap, and peek support.
  "nvim-treesitter/nvim-treesitter-textobjects",
  dependencies = {
    { "nvim-treesitter/nvim-treesitter" },
  },
  event = require("srv.utils.event").events.LazyFile,
}
