---@class Fun
local M = {}

local uv = vim.loop
if vim.fn.has "nvim-0.10.0" == 1 then
  uv = vim.uv
end

M.os_name = function()
  return uv.os_uname().sysname:lower()
end

---Functions to handle vim host programs
M.providers = {}

---The table of vim providers
---@return table providers
M.providers.get = function()
  return {
    node = {
      windows_nt = {
        x86_64 = os.getenv "APPDATA" .. "/npm/node_modules/neovim/bin/cli.js",
      },
      linux = { x86_64 = "/home/linuxbrew/.linuxbrew/bin/neovim-node-host", aarch64 = 0 },
    },

    ruby = {
      windows_nt = { x86_64 = "C:/tools/ruby31/bin/ruby.exe" },
      linux = { x86_64 = "/home/linuxbrew/.linuxbrew/bin/ruby", aarch64 = 0 },
    },

    perl = {
      windows_nt = { x86_64 = "C:/Strawberry/perl/bin/perl.exe" },
      linux = { x86_64 = "/home/linuxbrew/.linuxbrew/bin/perl", aarch64 = 0 },
    },

    python3 = {
      windows_nt = { x86_64 = os.getenv "USERPROFILE" .. "/.py-nvim/Scripts/python.exe" },
      linux = { x86_64 = "/home/sravioli/.py-nvim/bin/python3", aarch64 = 0 },
    },
  }
end

---Sets the values of all the vim host programs. No path found == disable.
M.providers.enable = function()
  local providers = M.providers.get()
  for provider, paths in pairs(providers) do
    vim.g[provider .. "_host_prog"] = nil

    local path = vim.fs.normalize(paths[M.os_name()][uv.os_uname().machine]) or 0
    vim.g[provider .. "_host_prog"] = path
  end
end

---Disables all vim host programs
M.providers.disable = function()
  for provider, _ in pairs(M.providers.get()) do
    vim.g["loaded_" .. provider .. "_provider"] = 0
  end
end

return M
