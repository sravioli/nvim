---User defined autogroups
---@module "autogroups"
---@author sRavioli
---@license GPL-3.0

local aug = vim.api.nvim_create_augroup

---User defined autogroups
local autogroups = {
  OnUiEnter = aug("OnUiEnter", {}),
  OnFileEnter = aug("OnFileEnter", {}),
  CursorGroup = aug("CursorGroup", {}),
  VimHelp = aug("VimHelpGroup", {}),
  OneKeyExit = aug("OneKeyExit", {}),

  barbecue = aug("Barbecue", {}),
  custom_highlights = aug("CustomHighlights", {}),
  BufDetect = aug("BufDetect", {}),
  lua_functions = aug("LuaFunctions", {}),
  null_ls = aug("LspFormatting", {}),
  lualine = aug("Lualine", { clear = true }),
}

return autogroups
