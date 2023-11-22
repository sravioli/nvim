--# selene: allow(mixed_table)
return {
  ---A fancy, configurable, notification manager for NeoVim.
  "rcarriga/nvim-notify",
  keys = {
    {
      "<leader>un",
      function()
        require("notify").dismiss { silent = true, pending = true }
      end,
      desc = "󰎟  Dismiss all Notifications",
    },
  },
  opts = {
    background_colour = "NotifyBackground",
    fps = 60,
    icons = {
      DEBUG = require("srv.preferences").icons.diagnostics.Debug,
      ERROR = require("srv.preferences").icons.diagnostics.Error,
      INFO = require("srv.preferences").icons.diagnostics.Info,
      TRACE = require("srv.preferences").icons.diagnostics.Trace,
      WARN = require("srv.preferences").icons.diagnostics.Warn,
    },
    level = 2,
    minimum_width = 50,
    render = "wrapped-compact",
    stages = "slide",
    timeout = 2000,
    top_down = true,
  },
  init = function()
    require("srv.utils.fn").lazy_notify()

    require("srv.utils.event").on_very_lazy(function()
      vim.notify = require "notify"
    end)

    ---load the notify telescope extension
    require("srv.utils.event").on_load("telescope.nvim", function()
      require("telescope").load_extension "notify"
    end)
  end,
}
