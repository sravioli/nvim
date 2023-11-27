return {
  ---IDE-like breadcrumbs, out of the box
  "Bekaboo/dropbar.nvim",
  dependencies = { "nvim-telescope/telescope-fzf-native.nvim" },
  event = require("srv.utils.event").events.LazyFile,
  opts = {
    general = { update_interval = 200 },

    icons = {
      symbols = require("srv.preferences").icons.kinds,
      ui = { menu = { indicator = " 󰅂 " } },
    },

    bar = { hover = false },

    menu = {
      keymaps = {
        ---vim like movements
        ["l"] = function()
          local menu = require("dropbar.utils").menu.get_current()
          if not menu then
            return
          end
          local cursor = vim.api.nvim_win_get_cursor(menu.win)
          local component = menu.entries[cursor[1]]:first_clickable(cursor[2])
          if component then
            menu:click_on(component, nil, 1, "l")
          end
        end,
        ["h"] = function()
          local menu = require("dropbar.utils").menu.get_current()
          if menu then
            menu:close()
          end
        end,
      },

      win_configs = { border = require("srv.preferences").border },
    },

    sources = {
      terminal = {
        show_current = true,
        name = function(buf)
          local name = vim.api.nvim_buf_get_name(buf)
          -- the second result val is the terminal object
          local term = select(2, require("toggleterm.terminal").identify(name))
          if term then
            return term.display_name or term.name
          else
            return name
          end
        end,
      },
    },
  },

  config = function(_, opts)
    require("dropbar").setup(opts)
    vim.keymap.set("n", "<leader>;", require("dropbar.api").pick)
  end,
}
