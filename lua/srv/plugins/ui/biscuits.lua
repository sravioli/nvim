return {
  ---Neovim port of Assorted Biscuits. Ends up with more supported languages
  ---too.
  "code-biscuits/nvim-biscuits",
  dependencies = { { "nvim-treesitter/nvim-treesitter" } },
  event = require("srv.utils.event").events.LazyFile,
  config = function()
    require("nvim-biscuits").setup {
      default_config = { prefix_string = " 󰆘 " },
      cursor_line_only = true,
      language_config = {
        vimdoc = { disabled = true },
      },
    }
  end,
}
