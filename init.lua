---Source neovim settings
require "srv.settings"

if vim.g.neovide then
  require "srv.neovide"
end

---Load plugins
require "srv.plugins"

---Load user autocommands
require "srv.utils.autocommands"

---Load non-plugin keymaps
require("srv.utils.fn").mappings.load()
