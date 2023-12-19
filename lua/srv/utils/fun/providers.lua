---functions to handle vim host programs
---
---@class Fun.providers
local M = {}

---The table of vim providers
---@return table providers
M.get = function()
	return {
		node = {
			windows_nt = {
				x86_64 = (os.getenv("APPDATA") or "") .. "/npm/node_modules/neovim/bin/cli.js",
			},
			linux = { x86_64 = "/home/linuxbrew/.linuxbrew/bin/neovim-node-host", aarch64 = 0 },
		},

		ruby = {
			windows_nt = { x86_64 = "C:/tools/ruby31/bin/ruby.exe" },
			linux = { x86_64 = "/home/linuxbrew/.linuxbrew/bin/ruby", aarch64 = 0 },
		},

		perl = {
			windows_nt = { x86_64 = "C:/Strawberry/perl/bin/perl.exe" },
			linux = { x86_64 = "/usr/bin/perl", aarch64 = 0 },
		},

		python3 = {
			windows_nt = {
				x86_64 = (os.getenv("USERPROFILE") or "") .. "/.py-nvim/Scripts/python.exe",
			},
			linux = { x86_64 = "/home/sravioli/.py-nvim/bin/python3", aarch64 = 0 },
		},
	}
end

---Sets the values of all the vim host programs. No path found == disable.
M.enable = function()
	local providers = M.get()
	for provider, paths in pairs(providers) do
		vim.g[provider .. "_host_prog"] = nil
		local sysname, machine = require("srv.utils.fun").os_info()

		local path = paths[sysname][machine]
		vim.g[provider .. "_host_prog"] = path ~= 0 and vim.fs.normalize(path) or path
	end
end

---Disables all vim host programs
M.disable = function()
	for provider, _ in pairs(M.get()) do
		vim.g["loaded_" .. provider .. "_provider"] = 0
	end
end

return M
