return {
  ---This is a Neovim plugin that helps you pick Nerd Font Icons, Symbols & Emojis
  "ziontee113/icon-picker.nvim",
  dependencies = { { "stevearc/dressing.nvim" } },
  keys = {
    { "<leader>si", "<cmd>IconPickerYank<CR>", desc = "󱩯  Search icons and more" },
    {
      "<M-i>",
      "<cmd>IconPickerInsert<CR>",
      desc = "󱩯  Search icons and more",
      mode = "i",
    },
  },
  config = function()
    require("icon-picker").setup {
      disable_legacy_commands = true,
    }
  end,
}
