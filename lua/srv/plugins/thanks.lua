return {
  ---Automatically star all the Neovim plugins you use.
  "jsongerber/thanks.nvim",
  cond = not vim.g.vscode,
  cmd = { "ThanksAll" },
  opts = {
    star_on_startup = true,
    unstar_on_unistall = true,
  },
}
