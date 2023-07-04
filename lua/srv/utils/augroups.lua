---User defined autogroups
---@module "autogroups"
---@author sRavioli
---@license GPL-3.0

---@type function Shorthand for `vim.api.nvim_create_augroup`.
---Define the autocmd group name for the following ":autocmd" commands.  The
---name "end" or "END" selects the default group.  To avoid confusion, the name
---should be different from existing {event} names, as this most likely will not
---do what you intended.
local aug = vim.api.nvim_create_augroup

---User defined autogroups
---@class Autogroups
local autogroups = {
  cursor = aug("CursorGroup", {}),
  exit_views = aug("ExitViews", {}),
  yank_highlight = aug("YankHighlight", {}),
  barbecue = aug("Barbecue", {}),
  custom_highlights = aug("CustomHighlights", {}),
  buf_detect = aug("BufDetect", {}),
  lua_functions = aug("LuaFunctions", {}),
  null_ls = aug("LspFormatting", {}),
  lualine = aug("Lualine", { clear = true }),
}

return autogroups
