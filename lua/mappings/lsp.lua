---@type function
local map = vim.keymap.set
local __border = require("preferences").border

map("n", "gD", function()
  vim.lsp.buf.declaration()
end, { desc = "LSP declaration" })

map("n", "gd", function()
  vim.lsp.buf.definition()
end, { desc = "LSP definition" })

map("n", "K", function()
  vim.lsp.buf.hover()
end, { desc = "LSP hover docs" })

map("n", "gi", function()
  vim.lsp.buf.implementation()
end, { desc = "LSP implementation" })

map("n", "<leader>ls", function()
  vim.lsp.buf.signature_help()
end, { desc = "LSP signature help" })

map("n", "<leader>D", function()
  vim.lsp.buf.type_definition()
end, { desc = "LSP definition type" })

-- map("n", "<leader>ra", "new", { desc = "LSP rename" })

map("n", "<leader>ca", function()
  vim.lsp.buf.code_action()
end, { desc = "LSP code actions" })

map("n", "gr", function()
  vim.lsp.buf.references()
end, { desc = "LSP references" })

map("n", "<leader>f", function()
  vim.diagnostic.open_float { border = __border }
end, { desc = "Floating diagnostic" })

map("n", "[d", function()
  vim.diagnostic.goto_prev { float = { border = __border } }
end, { desc = "desc" })

map("n", "]d", function()
  vim.diagnostic.goto_next { float = { border = __border } }
end, { desc = "desc" })

map("n", "<leader>q", function()
  vim.diagnostic.setloclist()
end, { desc = "Diagnostic loclist" })

map("n", "<leader>fm", function()
  vim.lsp.buf.format { async = true }
end, { desc = "LSP async formatting" })

map("n", "<leader>wa", function()
  vim.lsp.buf.add_workspace_folder()
end, { desc = "Add workspace folder" })

map("n", "<leader>wr", function()
  vim.lsp.buf.remove_workspace_folder()
end, { desc = "Remove workspace folder" })

map("n", "<leader>wl", function()
  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, { desc = "List workspace folders" })
