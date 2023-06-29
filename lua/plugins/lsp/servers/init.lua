local present, lspconfig = pcall(require, "lspconfig")
if not present then
  print "could not load lspconfig"
  return
end

local configs = require "plugins.lsp.servers.configs"

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
    on_attach = configs.on_attach,
    capabilities = configs.capabilities(),
    handlers = configs.handlers,

    settings = {
      Lua = require "plugins.lsp.servers.lua_ls",
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
