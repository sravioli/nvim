return {
  -- Indent guides for Neovim
  "lukas-reineke/indent-blankline.nvim",
  event = "BufWinEnter",
  init = function()
    vim.opt.list = true
    vim.opt.listchars:append "eol:↴"
  end,
  opts = {
    show_end_of_line = true,
    show_current_context = true,
    use_treesitter = true,
  },
}
