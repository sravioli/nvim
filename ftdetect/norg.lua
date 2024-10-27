vim.opt_local.conceallevel = 3
vim.opt_local.concealcursor = "vc"

vim.api.nvim_create_autocmd("BufWrite", {
  callback = function()
    vim.api.nvim_feedkeys("gg=G``", "n", true)
  end,
})

vim.api.nvim_set_hl(0, "@neorg.markup.verbatim", { fg = "#98bb6c", bg = "#2a2a37" })
