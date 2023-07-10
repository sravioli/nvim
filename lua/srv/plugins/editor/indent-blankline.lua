return {
  ---Indent guides for Neovim
  "lukas-reineke/indent-blankline.nvim",
  event = "BufReadPost",
  opts = {
    show_end_of_line = true,
    show_current_context = true,
    use_treesitter = true,
  },
}
