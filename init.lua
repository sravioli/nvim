---Source neovim settings
require "srv.config.settings"

if vim.g.neovide then
  require "srv.config.neovide"
end

---Load plugins
require "srv.plugins"

---Load user autocommands
require "srv.config.autocommands"

---Load non-plugin keymaps
require("srv.utils.keymaps").load()
