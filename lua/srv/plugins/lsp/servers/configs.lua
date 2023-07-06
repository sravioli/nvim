local M = {}

local __border = require("srv.preferences").border

M.on_attach = function(client, bufnr)
  ---prefer null-ls
  client.server_capabilities.documentFormattingProvider = false
  client.server_capabilities.documentRangeFormattingProvider = false

  ---load lsp mappings
  require("srv.utils.fn").mappings.load("lsp", { buffer = bufnr })

  ---change diagnostic settings
  vim.diagnostic.config {
    underline = true,

    virtual_text = {
      severity = {
        min = vim.diagnostic.severity.ERROR,
      },
      source = "always",
      spacing = 1,
      prefix = require("srv.preferences").icons.diagnostics.Error,
    },

    signs = true,

    float = {
      severity_sort = true,
      header = " Diagnotics:",
      source = "always", ---Or "if_many"
    },

    update_in_insert = false,
    severity_sort = true,
  }

  require("lspconfig.ui.windows").default_options = { border = __border }

  ---Show diagnostic in a floating window.
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
    { border = __border, focusable = false, relative = "cursor" }
  ),
}

return M
