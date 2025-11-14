local fun = require "utils.fun"
local prefs = require "utils.prefs"

return {

  -- {{{1 fidget.nvim: extensible UI for Neovim notifications and LSP progress messages.
  {
    "j-hui/fidget.nvim",
    cond = not vim.g.vscode,
    event = "LspAttach",
    cmd = { "Fidget" },
    opts = {
      progress = {
        ignore_empty_message = true,
        display = {
          render_limit = 10,
          done_ttl = 2,
          progress_icon = {
            pattern = prefs.spinners.dots,
            period = 1,
          },
        },
      },
    },
  }, -- }}}

  -- {{{1 diagflow.nim: LSP diagnostics in virtual text at the top right of your screen
  {
    "dgagn/diagflow.nvim",
    cond = not vim.g.vscode,
    event = "LspAttach",
    opts = {
      scope = "line",
      padding_right = 2,
      gap_size = 2,
      format = fun.lsp.format_message,
      show_borders = true,
      border_chars = prefs.border_chars,

      -- don't update diagnostics when in insert mode.
      toggle_event = { "InsertEnter", "InsertLeave" },
      render_event = { "CursorMoved" },
      update_event = { "DiagnosticChanged", "BufReadPost" },
    },
  }, -- }}}
}
