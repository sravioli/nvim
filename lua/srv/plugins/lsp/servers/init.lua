---@class (exact) LspServers
---@field lua_ls         table
---@field clangd         table
---@field jsonls         table
---@field marksman       table
---@field markdown_oxide table
---@field taplo          table
---@field texlab         table
---@field yamlls         table
---@field bashls         table
local M = {}

setmetatable(M, {
  __index = function(t, k)
    local ok, mod = pcall(require, "srv.plugins.lsp.servers." .. k)
    if not ok then
      mod = require "srv.plugins.lsp.servers.default"
    end
    t[k] = mod
    return t[k]
  end,
})

return M
