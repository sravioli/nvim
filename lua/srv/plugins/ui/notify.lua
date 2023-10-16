return {
  ---A fancy, configurable, notification manager for NeoVim.
  "rcarriga/nvim-notify",
  -- enabled = false,
  event = "VeryLazy",
  opts = function()
    local icons = require("srv.preferences").icons.diagnostics
    return {
      background_colour = "NotifyBackground",
      fps = 60,
      icons = {
        DEBUG = icons.Debug,
        ERROR = icons.Error,
        INFO = icons.Info,
        TRACE = icons.Trace,
        WARN = icons.Warn,
      },
      level = 2,
      minimum_width = 50,
      render = "wrapped-compact",
      stages = "slide",
      timeout = 2000,
      top_down = true,
    }
  end,
}
