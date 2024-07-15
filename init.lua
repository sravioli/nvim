---Source neovim settings
require "srv.config.settings"

if vim.g.neovide then
  require "srv.config.neovide"
end

---Load plugins
require "srv.lazy"

---Load user autocommands
require "srv.config.autocommands"

---Load non-plugin keymaps
require "srv.keymaps.editor"
