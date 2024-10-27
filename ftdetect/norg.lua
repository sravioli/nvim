vim.opt_local.conceallevel = 3
vim.opt_local.concealcursor = "vc"

vim.api.nvim_set_hl(0, "@neorg.markup.verbatim", { fg = "#98bb6c", bg = "#2a2a37" })

vim.api.nvim_create_autocmd("BufWritePre", {
  group = vim.api.nvim_create_augroup("Neorg", {}),
  pattern = "*.norg",
  callback = function()
    vim.cmd.Neorg "update-metadata"
    vim.api.nvim_feedkeys("gg=G``zzzv", "n", true)
  end,
})
