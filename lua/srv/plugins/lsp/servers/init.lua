local present, lspconfig = pcall(require, "lspconfig")
if not present then
  vim.notify "could not load lspconfig"
  return
end

local configs = require "srv.plugins.lsp.servers.configs"

local servers = {
  "lua_ls",
  "marksman",
  "jsonls",
  "taplo",
  "yamlls",
  "clangd",
  "texlab",
  -- "powershell_es",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = configs.on_attach,
    capabilities = configs.capabilities(),
    handlers = configs.handlers,

    settings = {
      Lua = require "srv.plugins.lsp.servers.lua_ls",
      texlab = require "srv.plugins.lsp.servers.texlab",
    },

    marksman = require "srv.plugins.lsp.servers.marksman",
    jsonls = require "srv.plugins.lsp.servers.jsonls",
    taplo = require "srv.plugins.lsp.servers.taplo",
    yamlls = require "srv.plugins.lsp.servers.yamlls",
    clangd = require "srv.plugins.lsp.servers.clangd",
    -- powershell_es = require "srv.plugins.lsp.servers.powershell_es",
  }
end
