return {
  ---get the nerdfont icons inside neovim
  "glepnir/nerdicons.nvim",
  keys = {
    { "<leader>ni", "<cmd>NerdIcons<CR>", desc = "󱩯  Search nerdfont icons" },
  },
  opts = {
    border = require("srv.preferences").border, ---Border
    prompt = "󰨭 ", ---Prompt Icon
    preview_prompt = " ", ---Preview Prompt Icon
    width = 0.5, ---flaot window width
    down = "<C-j>", ---Move down in preview
    up = "<C-k>", ---Move up in preview
    copy = "<Tab>", ---Copy to the clipboard
  },
}
