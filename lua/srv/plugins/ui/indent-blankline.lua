return {
  ---Indent guides for Neovim
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  event = "BufReadPost",
  opts = {
    indent = { char = "│" },
    scope = { enabled = true },
  },
}
