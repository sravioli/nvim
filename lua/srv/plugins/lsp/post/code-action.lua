return {
  ---Pop-up menu for code actions to show meta-information and diff preview
  "weilbith/nvim-code-action-menu",
  enabled = true,
  cmd = "CodeActionMenu",
  init = function()
    ---Window borders
    vim.g.code_action_menu_window_border = require("srv.preferences").border

    ---Show/hide UI parts
    -- vim.g.code_action_menu_show_details = false
    -- vim.g.code_action_menu_show_diff = false
    -- vim.g.code_action_menu_show_action_kind = false
  end,
}
