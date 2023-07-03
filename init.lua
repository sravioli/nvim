---Source neovim settings
require "settings"

---Load plugins
require "plugins"

---Load user autocommands
require "utils.autocommands"

---Load non-plugin keymaps
require("utils.fn").mappings.load()
