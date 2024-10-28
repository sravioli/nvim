vim.opt_local.conceallevel = 3
vim.opt_local.concealcursor = "vc"
vim.opt_local.fileformat = "unix"

vim.api.nvim_set_hl(0, "@neorg.markup.verbatim", { fg = "#98bb6c", bg = "#2a2a37" })

vim.api.nvim_create_autocmd("BufWritePre", {
  group = vim.api.nvim_create_augroup("Neorg", {}),
  pattern = "*.norg",
  callback = function()
    vim.cmd [[%s:Get your own SQL Server$::gIe]]
    vim.cmd [[%s/\r/\r/ge]]
    vim.cmd [[g/^\_$\n\_^$/d]]
    vim.cmd.Neorg "update-metadata"
    vim.api.nvim_feedkeys("gg=G``zzzv", "n", true)
  end,
})
