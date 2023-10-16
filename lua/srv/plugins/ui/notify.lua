return {
  ---A fancy, configurable, notification manager for NeoVim.
  "rcarriga/nvim-notify",
  -- enabled = false,
  event = "VeryLazy",
  config = {
    background_colour = "NotifyBackground",
    fps = 30,
    icons = {
      DEBUG = "",
      ERROR = "",
      INFO = "",
      TRACE = "✎",
      WARN = "",
    },
    level = 2,
    minimum_width = 50,
    render = "wrapped-compact",
    stages = "fade_in_slide_out",
    timeout = 2000,
    top_down = true,
  },
}
