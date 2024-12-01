---@class Keymap
local Keymaps = require "srv.keymaps"
local fun = require "srv.utils.fun" ---@class Fun
local prefs = require "srv.preferences" ---@class Preferences

return {
  -- {{{1 dressing.nvim: improve the default vim.ui interfaces
  {
    "stevearc/dressing.nvim",
    cond = not vim.g.vscode,
    enabled = not vim.g.vscode,
    opts = {},
    init = function()
      ---@diagnostic disable-next-line: duplicate-set-field
      vim.ui.select = function(...)
        require("lazy").load { plugins = { "dressing.nvim" } }
        return vim.ui.select(...)
      end
      ---@diagnostic disable-next-line: duplicate-set-field
      vim.ui.input = function(...)
        require("lazy").load { plugins = { "dressing.nvim" } }
        return vim.ui.input(...)
      end
    end,
  }, -- }}}

  -- {{{1 barbar.nvim: the neovim tabline plugin.
  {
    "romgrk/barbar.nvim",
    cond = not vim.g.vscode,
    enabled = not vim.g.vscode,
    event = "BufAdd",
    init = function()
      vim.g.barbar_auto_setup = false
    end,
    opts = function()
      local signs = prefs.icons.diagnostics
      return {
        animation = true,
        auto_hide = true,
        tabpages = true,
        hide = { extensions = true, inactive = false },
        highlight_visible = true,

        icons = {
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

          modified = { button = "●" },
          pinned = { button = "", filename = true },

          preset = "slanted",

          alternate = { filetype = { enabled = false } },
          current = { buffer_index = false },
          inactive = { button = "󰒲" },
          visible = { modified = { buffer_number = true } },
        },
      }
    end,

    config = function(_, opts)
      require("barbar").setup(opts)
      local keys = Keymaps.load "barbar" or {}
      keys:register()
    end,
  }, -- }}}

  -- {{{1 heirline.nvim: no-nonsense Neovim Statusline plugin
  {
    "rebelot/heirline.nvim",
    cond = not vim.g.vscode,
    enabled = not vim.g.vscode,
    event = "VeryLazy",
    init = function()
      vim.g.heirline_lastatus = vim.o.laststatus
      if vim.fn.argc(-1) > 0 then
        vim.o.statusline = " " -- set an empty statusline till lualine loads
      else
        vim.o.laststatus = 0 -- hide the statusline on the starter page
      end
    end,
    opts = function()
      if not pcall(require, "heirline") then
        return
      end

      vim.o.laststatus = vim.g.heirline_lastatus
      local heirline_lines = require "srv.utils.heirline"
      return {
        statusline = heirline_lines.statusline,
      }
    end,
  }, -- }}}

  -- {{{1 dropbar.nvim: IDE-like breadcrumbs, out of the box
  {
    "Bekaboo/dropbar.nvim",
    cond = not vim.g.vscode,
    enabled = not vim.g.vscode or vim.fn.has "nvim-0.10.0" == 1,
    dependencies = { "nvim-telescope/telescope-fzf-native.nvim" },
    event = require("srv.utils.events").LazyFile,
    opts = {
      icons = {
        symbols = prefs.icons.kinds,
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

        win_configs = { border = prefs.border },
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
      vim.keymap.set(
        "n",
        "<leader>;",
        require("dropbar.api").pick,
        { desc = "Dropbar pick" }
      )
    end,
  }, -- }}}

  -- {{{1 which-key.nvim: display a popup with keybindings for the command you started typing
  {
    "folke/which-key.nvim",
    cond = not vim.g.vscode,
    enabled = not vim.g.vscode,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    init = function()
      vim.opt.timeout = true
      vim.opt.timeoutlen = 300
    end,
    opts = {
      preset = "modern",

      spec = {
        { "<leader>b", group = "+buffer", mode = "n" },
      },

      -- key_labels = {
      --   ["<space>"] = "SPC",
      --   ["<cr>"] = "RET",
      --   ["<tab>"] = "TAB",
      -- },
      -- defaults = {
      --   mode = { "n", "v" },
      --   ["g"] = { name = "+goto" },
      --   ["]"] = { name = "+next" },
      --   ["["] = { name = "+prev" },
      --   ["<leader>b"] = { name = "+buffer" },
      --   ["<leader>c"] = { name = "+code" },
      --   ["<leader>cg"] = { name = "+generate" },
      --   ["<leader>f"] = { name = "+file/find" },
      --   ["<leader>h"] = { name = "+hunk" },
      --   ["<leader>s"] = { name = "+search" },
      --   ["<leader>x"] = { name = "+diagnostics/quickfix" },
      --   ["<leader>r"] = { name = "+refactor" },
      --   ["<leader>t"] = { name = "+toggle" },
      --   ["<leader>d"] = { name = "+debug" },
      --   ["<leader>da"] = { name = "+adapters" },
      --   ["<leader>w"] = { name = "+workspace" },
      -- },
    },
  }, -- }}}

  -- {{{1 zen-mode.nvim: distraction-free coding for Neovim
  {
    "folke/zen-mode.nvim",
    cond = not vim.g.vscode,
    cmd = "ZenMode",
    keys = {
      {
        "<leader>tz",
        function()
          require("zen-mode").toggle()
        end,
        desc = "󰚀  Toggle zen mode",
      },
    },
    opts = {
      window = {
        width = function()
          return vim.api.nvim_get_option_value("colorcolumn", { scope = "local" }) + 5
        end,
        options = {
          signcolumn = "no", -- disable signcolumn
          cursorline = false, -- disable cursorline
          cursorcolumn = false, -- disable cursor column
          foldcolumn = "0", -- disable fold column
          list = false, -- disable whitespace characters
        },
      },
      plugins = {
        options = {
          enabled = true,
          ruler = false, -- disables the ruler text in the cmd line area
          showcmd = false, -- disables the command in the last line of the screen
        },
        twilight = { disabled = true }, -- enable to start Twilight when zen mode opens
        gitsigns = { enabled = true }, -- disables git signs
      },
    },
  }, -- }}}

  -- {{{1 trouble.nvim: pretty diagnostics, references, telescope results, quickfix and loclist
  {
    "folke/trouble.nvim",
    cond = not vim.g.vscode,
    enabled = not vim.g.vscode,
    cmd = { "Trouble" },
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics split toggle<cr>",
        desc = "󱪗  Document Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "  Workspace Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "  Location List (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "󱖫  Quickfix List (Trouble)",
      },
    },
    opts = {
      auto_close = true,
      modes = {
        split = {
          mode = "diagnostics",
          filter = function(items)
            local severity = vim.diagnostic.severity.HINT
            for _, item in ipairs(items) do
              severity = math.min(severity, item.severity)
            end
            return vim.tbl_filter(function(item)
              return item.severity == severity
            end, items)
          end,
          preview = {
            type = "split",
            relative = "win",
            position = "right",
          },
          size = 0.3,
        },
      },
    },
  }, -- }}}

  -- {{{1 todo-comments: highlight, list and search todo comments in your projects
  {
    "folke/todo-comments.nvim",
    cond = not vim.g.vscode,
    dependencies = { "nvim-lua/plenary.nvim" },
    event = require("srv.utils.events").LazyFile,
    keys = {
      {
        "]t",
        function()
          require("todo-comments").jump_next()
        end,
        desc = "  Next todo comment",
      },
      {
        "[t",
        function()
          require("todo-comments").jump_prev()
        end,
        desc = "   Previous todo comment",
      },
      { "<leader>xt", "<cmd>TodoTrouble<CR>", desc = "  Todo (Trouble)" },
      {
        "<leader>xT",
        "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<CR>",
        desc = "  Todo/Fix/Fixme (Trouble)",
      },
      { "<leader>st", "<cmd>TodoTelescope<CR>", desc = "  Todo" },
      {
        "<leader>sT",
        "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<CR>",
        desc = "  Todo/Fix/Fixme",
      },
    },
    config = true,
  }, -- }}}

  -- {{{1 nvim-notify: fancy, configurable, notification manager for NeoVim.
  {
    "rcarriga/nvim-notify",
    cond = not vim.g.vscode,
    enabled = not vim.g.vscode,
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
        ERROR = prefs.icons.diagnostics.Error,
        WARN = prefs.icons.diagnostics.Warn,
        INFO = prefs.icons.diagnostics.Info,
        DEBUG = prefs.icons.diagnostics.Debug,
        TRACE = prefs.icons.diagnostics.Trace,
      },
      level = 2,
      minimum_width = 50,
      render = "wrapped-compact",
      stages = "slide",
      timeout = 2000,
      top_down = true,
    },
    init = function()
      fun.lazy_notify()

      fun.on_very_lazy(function()
        vim.notify = require "notify"
      end)

      ---load the notify telescope extension
      fun.on_load("telescope.nvim", function()
        require("telescope").load_extension "notify"
      end)
    end,
  }, -- }}}

  -- {{{1 nvim-hlslens: hlsearch Lens for Neovim
  {
    "kevinhwang91/nvim-hlslens",
    cond = not vim.g.vscode,
    event = "CmdlineEnter",
    opts = { calm_down = true },
    config = function(_, opts)
      require("hlslens").setup(opts)
      local keys = Keymaps.load "hlslens" or {}
      keys:register()
    end,
  }, -- }}}

  -- {{{1 indent-blankline: indent guides for Neovim
  {
    "lukas-reineke/indent-blankline.nvim",
    cond = not vim.g.vscode,
    main = "ibl",
    event = require("srv.utils.events").LazyFile,
    opts = {
      scope = {
        enabled = true,
        include = {
          node_type = { lua = { "return_statement", "table_constructor" } },
        },
      },
    },
  }, -- }}}

  -- {{{1 nvim-colorizer.lua: maintained fork of the fastest Neovim colorizer
  {
    "NvChad/nvim-colorizer.lua",
    cond = not vim.g.vscode,
    event = require("srv.utils.events").LazyFile,
    opts = {
      filetypes = { "*" },
      user_default_options = {
        RRGGBBAA = true, -- #RRGGBBAA hex codes
        AARRGGBB = true, -- 0xAARRGGBB hex codes
        rgb_fn = true, -- CSS rgb() and rgba() functions
        hsl_fn = true, -- CSS hsl() and hsla() functions
        css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
        -- Available modes for `mode`: foreground, background,  virtualtext
        mode = "background", -- Set the display mode.
        -- Available methods are false / true / "normal" / "lsp" / "both"
        -- True is same as normal
        tailwind = true, -- Enable tailwind colors
        -- parsers can contain values used in |user_default_options|
        sass = { enable = true, parsers = { "css" } }, -- Enable sass colors
        virtualtext = "█",
        -- update color values even if buffer is not focused
        -- example use: cmp_menu, cmp_docs
        always_update = false,
      },
    },
  }, -- }}}

  -- {{{1 nvim-biscuits: neovim port of Assorted Biscuits.
  {
    "code-biscuits/nvim-biscuits",
    cond = not vim.g.vscode,
    event = require("srv.utils.events").LazyFile,
    config = function()
      require("nvim-biscuits").setup {
        default_config = { prefix_string = " 󰆘 " },
        cursor_line_only = true,
        language_config = {
          vimdoc = { disabled = true },
        },
      }
    end,
  }, -- }}}

  -- {{{1 smear-cursor.nvim: 🚄 Neovim plugin to animate the cursor with a smear effect in all terminals
  {
    "sphamba/smear-cursor.nvim",
    enabled = false,
    event = require("srv.utils.events").LazyFile,
    opts = {
      stiffness = 0.8,
      trailing_stiffness = 0.6,
      trailing_exponent = 0,
      distance_stop_animating = 0.5,
      hide_target_hack = false,
      legacy_computing_symbols_support = true,
    },
  }, -- }}}
}
