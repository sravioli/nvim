local bufnr = vim.api.nvim_get_current_buf()
local map = vim.keymap.set

map("n", "<leader>a", function()
  vim.cmd.RustLsp "codeAction" -- supports rust-analyzer's grouping
  -- or vim.lsp.buf.codeAction() if you don't want grouping.
end, { silent = true, buffer = bufnr })
map("n", "K", function()
  vim.cmd.RustLsp { "hover", "actions" }
end, { silent = true, buffer = bufnr })
