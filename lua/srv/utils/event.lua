local M = {}

---Executes a function when a plugin is loaded.
---
---@param name string The name of the plugin.
---@param fn   fun(name: string) The function to be executed when the plugin is loaded.
function M.on_load(name, fn)
  local Config = require "lazy.core.config"
  if Config.plugins[name] and Config.plugins[name]._.loaded then
    fn(name)
  else
    vim.api.nvim_create_autocmd("User", {
      pattern = "LazyLoad",
      callback = function(event)
        if event.data == name then
          fn(name)
          return true
        end
      end,
    })
  end
end

---@class Events
---@field LazyFile    string[] equivalent to `{ "BufReadPost", "BufNewFile", "BufWritePre" }`
---@field FocusGained string[] equivalent to `{ "FocusGained", "TermClose", "TermLeave" }`
M.events = {
  LazyFile = { "BufReadPost", "BufNewFile", "BufWritePre" },
  FocusGained = { "FocusGained", "TermClose", "TermLeave" },
}

return M
