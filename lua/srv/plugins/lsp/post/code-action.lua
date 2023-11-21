return {
  ---Pop-up menu for code actions to show meta-information and diff preview
  "weilbith/nvim-code-action-menu",
  enabled = true,
  cmd = "CodeActionMenu",
  init = function()
    vim.g.code_action_menu_window_border = require("srv.preferences").border
  end,
}
