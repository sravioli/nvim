return {
  ---Automatically star all the Neovim plugins you use.
  "jsongerber/thanks.nvim",
  cmd = { "ThanksAll" },
  opts = {
    star_on_startup = true,
    unstar_on_unistall = true,
  },
}
