local present, lspconfig = pcall(require, "lspconfig")
if not present then
  print "could not load lspconfig"
  return
end

local __border = require("preferences").border
local fn = require "utils.fn"

-- custom on_attach() function with extra things
local on_attach = function(client, bufnr)
  -- prefer null-ls
  client.server_capabilities.documentFormattingProvider = false
  client.server_capabilities.documentRangeFormattingProvider = false

  -- load lsp mappings
  fn.load_mappings("lsp", { buffer = bufnr })

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

  --  ---custom namespace
  --  local ns = vim.api.nvim_create_namespace "severe-diagnostics"
  --
  --  ---reference to the original handler
  --  local orig_signs_handler = vim.diagnostic.handlers.signs
  --
  --  ---Overriden diagnostics signs helper to only show the single most relevant sign
  --  ---@see `:h diagnostic-handlers`
  --  vim.diagnostic.handlers.signs = {
  --    show = function(_, bufnr, _, opts)
  --      -- get all diagnostics from the whole buffer rather
  --      -- than just the diagnostics passed to the handler
  --      local diagnostics = vim.diagnostic.get(bufnr)
  --
  --      local filtered_diagnostics = fn.filter_diagnostics(diagnostics)
  --
  --      -- pass the filtered diagnostics (with the
  --      -- custom namespace) to the original handler
  --      orig_signs_handler.show(ns, bufnr, filtered_diagnostics, opts)
  --    end,
  --
  --    hide = function(_, bufnr)
  --      orig_signs_handler.hide(ns, bufnr)
  --    end,
  --  }

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

require("lspconfig.ui.windows").default_options = {
  border = __border,
}

-- LSP settings (for overriding per client)
local handlers = {
  ["textDocument/hover"] = vim.lsp.with(
    vim.lsp.handlers.hover,
    { border = __border }
  ),
  ["textDocument/signatureHelp"] = vim.lsp.with(
    vim.lsp.handlers.signature_help,
    { border = __border }
  ),
}

local servers = {
  "lua_ls",
  -- "marksman",
  -- "jsonls",
  -- "taplo",
  -- "yamlls",
  -- "clangd",
  -- "texlab",
  -- "powershell_es",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    handlers = handlers,

    settings = {
      Lua = require "plugins.configs.lsp.lua_ls",
      -- texlab = require "plugins.configs.lsp.texlab",
    },

    -- marksman = require "plugins.configs.lsp.marksman",
    -- jsonls = require "plugins.configs.lsp.jsonls",
    -- taplo = require "plugins.configs.lsp.taplo",
    -- yamlls = require "plugins.configs.lsp.yamlls",
    -- clangd = require "plugins.configs.lsp.clangd",
    -- powershell_es = require "plugins.configs.lsp.powershell_es",
  }
end
