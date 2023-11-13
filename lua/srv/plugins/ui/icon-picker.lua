return {
  ---This is a Neovim plugin that helps you pick Nerd Font Icons, Symbols & Emojis
  "ziontee113/icon-picker.nvim",
  dependencies = { { "stevearc/dressing.nvim" } },
  keys = {
    {
      "<leader>si",
      "<cmd>IconPickerYank alt_font emoji html_colors nerd_font_v3 symbols<CR>",
      desc = "󱩯  Search icons and more",
    },
    {
      "<M-i>",
      "<cmd>IconPickerInsert alt_font emoji html_colors nerd_font_v3 symbols<CR>",
      desc = "󱩯  Search icons and more",
      mode = "i",
    },
  },
  opts = {
    disable_legacy_commands = true,
  },
}
