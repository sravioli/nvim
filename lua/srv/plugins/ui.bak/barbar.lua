return {
  ---The neovim tabline plugin.
  "romgrk/barbar.nvim",
  dependencies = {
    { "nvim-tree/nvim-web-devicons" },
    { "lewis6991/gitsigns.nvim" },
    { "rebelot/kanagawa.nvim" },
  },
  event = "BufAdd",
  init = function()
    vim.g.barbar_auto_setup = false
    require("srv.utils.fn").mappings.load "barbar"
  end,
  opts = function()
    local signs = require("srv.preferences").icons.diagnostics
    return {
      ---Enable/disable animations
      animation = false,

      ---Enable/disable auto-hiding the tab bar when there is a single buffer
      auto_hide = true,

      ---Hide inactive buffers and file extensions. Other options are `alternate`, `current`, and `visible`.
      hide = { extensions = true, inactive = false },

      ---Enable highlighting visible buffers
      highlight_visible = false,

      icons = {
        ---Configure the base icons on the bufferline.
        ---Valid options to display the buffer index and -number are `true`, 'superscript' and 'subscript'
        buffer_index = false,
        buffer_number = false,
        button = "×",
        ---Enables / disables diagnostic symbols
        diagnostics = {
          [vim.diagnostic.severity.ERROR] = { enabled = true, icon = signs.Error },
          [vim.diagnostic.severity.WARN] = { enabled = true, icon = signs.Warn },
          [vim.diagnostic.severity.INFO] = { enabled = true, icon = signs.Info },
          [vim.diagnostic.severity.HINT] = { enabled = true, icon = signs.Hint },
        },
        gitsigns = {
          added = { enabled = true, icon = "+" },
          changed = { enabled = true, icon = "~" },
          deleted = { enabled = true, icon = "-" },
        },

        ---Configure the icons on the bufferline when modified or pinned.
        ---Supports all the base icon options.
        modified = { button = "●" },
        pinned = { button = "", filename = true },

        ---Use a preconfigured buffer appearance— can be 'default', 'powerline', or 'slanted'
        preset = "slanted",

        ---Configure the icons on the bufferline based on the visibility of a buffer.
        ---Supports all the base icon options, plus `modified` and `pinned`.
        alternate = { filetype = { enabled = false } },
        current = { buffer_index = false },
        inactive = { button = "󰒲" },
        visible = { modified = { buffer_number = true } },
      },
    }
  end,
}
