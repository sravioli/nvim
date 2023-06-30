local present, lspconfig = pcall(require, "lspconfig")
if not present then
  print "could not load lspconfig"
  return
end

local configs = require "plugins.lsp.servers.configs"

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
      Lua = require "plugins.lsp.servers.lua_ls",
      texlab = require "plugins.lsp.servers.texlab",
    },

    marksman = require "plugins.lsp.servers.marksman",
    jsonls = require "plugins.lsp.servers.jsonls",
    taplo = require "plugins.lsp.servers.taplo",
    yamlls = require "plugins.lsp.servers.yamlls",
    clangd = require "plugins.lsp.servers.clangd",
    -- powershell_es = require "plugins.lsp.servers.powershell_es",
  }
end
