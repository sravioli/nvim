return {
  ---Indent guides for Neovim
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  event = "BufReadPost",
  opts = { scope = { enabled = false } },
}
