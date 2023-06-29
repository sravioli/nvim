local M = {}

local __border = require("preferences").border

M.on_attach = function(client, bufnr)
  -- prefer null-ls
  client.server_capabilities.documentFormattingProvider = false
  client.server_capabilities.documentRangeFormattingProvider = false

  -- load lsp mappings
  require("utils.fn").load_mappings("lsp", { buffer = bufnr })

  -- if client.server_capabilities.documentSymbolProvider then
  --   require("nvim-navic").attach(client, bufnr)
  --   require("nvim-navbuddy").attach(client, bufnr)
  -- end

  vim.diagnostic.config {
    virtual_text = false,
    float = {
      source = "always", -- Or "if_many"
    },
    signs = true,
    underline = true,
    severity_sort = true,
  }

  require("lspconfig.ui.windows").default_options = {
    border = __border,
  }

  local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
  for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
  end

  -- Show diagnostic in a floating window.
  vim.api.nvim_create_autocmd("CursorHold", {
    buffer = bufnr,
    callback = function()
      local opts = {
        focusable = false,
        close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
        border = __border,
        source = "always",
        prefix = " ",
        scope = "cursor",
      }
      vim.diagnostic.open_float(nil, opts)
    end,
  })
end

M.capabilities = function()
  local capabilities = require("cmp_nvim_lsp").default_capabilities()

  capabilities.offsetEncoding = { "utf-16" }
  capabilities.textDocument.completion.completionItem = {
    documentationFormat = { "markdown", "plaintext" },
    snippetSupport = true,
    preselectSupport = true,
    insertReplaceSupport = true,
    labelDetailsSupport = true,
    deprecatedSupport = true,
    commitCharactersSupport = true,
    tagSupport = { valueSet = { 1 } },
    resolveSupport = {
      properties = {
        "documentation",
        "detail",
        "additionalTextEdits",
      },
    },
  }
  return capabilities
end

M.handlers = {
  ["textDocument/hover"] = vim.lsp.with(
    vim.lsp.handlers.hover,
    { border = __border }
  ),

  ["textDocument/signatureHelp"] = vim.lsp.with(
    vim.lsp.handlers.signature_help,
    { border = __border }
  ),
}

return M
