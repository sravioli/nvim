local fun = require "srv.utils.fun" ---@class Fun
local preferences = require "srv.preferences" ---@class Preferences

return {
  -- {{{1 dressing.nvim: improve the default vim.ui interfaces
  {
    "stevearc/dressing.nvim",
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
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
      { "lewis6991/gitsigns.nvim" },
      { "rebelot/kanagawa.nvim" },
    },
    event = "BufAdd",
    init = function()
      vim.g.barbar_auto_setup = false
    end,
    opts = function()
      local signs = preferences.icons.diagnostics
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
      fun.keymaps.load("barbar", { noremap = true, silent = true })
    end,
  }, -- }}}

  -- {{{1 heirline.nvim: no-nonsense Neovim Statusline plugin
  {
    "rebelot/heirline.nvim",
    dependencies = {
      { "rebelot/kanagawa.nvim" },
      { "nvim-tree/nvim-web-devicons" },
    },
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
    enabled = vim.fn.has "nvim-0.10.0" == 1,
    dependencies = { "nvim-telescope/telescope-fzf-native.nvim" },
    event = require("srv.utils.events").LazyFile,
    opts = {
      general = { update_interval = 200 },

      icons = {
        symbols = preferences.icons.kinds,
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

        win_configs = { border = preferences.border },
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
  }, -- }}}

  -- {{{1 which-key.nvim: display a popup with keybindings for the command you started typing
  {
    "folke/which-key.nvim",
    keys = {
      { "g", mode = { "n", "v" } },
      { "]", mode = { "n", "v" } },
      { "[", mode = { "n", "v" } },
      { "<leader>", mode = { "n", "v" } },
      { "z" },
    },
    init = function()
      vim.opt.timeout = true
      vim.opt.timeoutlen = 300
    end,
    opts = {
      window = { border = preferences.border },
      layout = {
        height = { min = 4, max = 25 },
        width = { min = 20, max = 50 },
        spacing = 3,
        align = "center",
      },
      key_labels = {
        ["<space>"] = "SPC",
        ["<cr>"] = "RET",
        ["<tab>"] = "TAB",
      },
      defaults = {
        mode = { "n", "v" },
        ["g"] = { name = "+goto" },
        ["]"] = { name = "+next" },
        ["["] = { name = "+prev" },
        ["<leader>b"] = { name = "+buffer" },
        ["<leader>c"] = { name = "+code" },
        ["<leader>cg"] = { name = "+generate" },
        ["<leader>f"] = { name = "+file/find" },
        ["<leader>h"] = { name = "+hunk" },
        ["<leader>s"] = { name = "+search" },
        ["<leader>x"] = { name = "+diagnostics/quickfix" },
        ["<leader>r"] = { name = "+refactor" },
        ["<leader>t"] = { name = "+toggle" },
        ["<leader>d"] = { name = "+debug" },
        ["<leader>da"] = { name = "+adapters" },
        ["<leader>w"] = { name = "+workspace" },
      },
    },
    config = function(_, opts)
      local wk = require "which-key"
      wk.setup(opts)
      wk.register(opts.defaults)
    end,
  }, -- }}}

  -- {{{1 zen-mode.nvim: distraction-free coding for Neovim
  {
    "folke/zen-mode.nvim",
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
        twilight = { enabled = true }, -- enable to start Twilight when zen mode opens
        gitsigns = { enabled = true }, -- disables git signs
      },
    },
  }, -- }}}

  -- {{{1 twilight.nvim: dims inactive portions of the code you're editing using TreeSitter.
  {
    "folke/twilight.nvim",
    config = true,
  }, -- }}}

  -- {{{1 trouble.nvim: pretty diagnostics, references, telescope results, quickfix and loclist
  {
    "folke/trouble.nvim",
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
        ERROR = preferences.icons.diagnostics.Error,
        WARN = preferences.icons.diagnostics.Warn,
        INFO = preferences.icons.diagnostics.Info,
        DEBUG = preferences.icons.diagnostics.Debug,
        TRACE = preferences.icons.diagnostics.Trace,
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
    event = "CmdlineEnter",
    opts = { calm_down = true },
    config = function(_, opts)
      require("hlslens").setup(opts)
      fun.keymaps.load("hls-lens", { noremap = true, silent = true })
    end,
  }, -- }}}

  -- {{{1 gitsigns.nvim: git integration for buffers
  {
    "lewis6991/gitsigns.nvim",
    event = require("srv.utils.events").LazyFile,
    opts = {
      signs = {
        add = { text = "│" },
        change = { text = "│" },
        delete = { text = "󰍵" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
        untracked = { text = "│" },
      },
      preview_config = { border = preferences.border },

      on_attach = function(bufnr)
        fun.keymaps.load("gitsigns", { buffer = bufnr })
      end,
    },
  }, -- }}}

  -- {{{1 indent-blankline: indent guides for Neovim
  {
    "lukas-reineke/indent-blankline.nvim",
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
    dependencies = { { "nvim-treesitter/nvim-treesitter" } },
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

  -- {{{1 alpha.nvim: lua powered greeter like vim-startify/dashboard-nvim
  {
    "goolord/alpha-nvim",
    enabled = false,
    event = "VimEnter",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local present, alpha = pcall(require, "alpha")
      if not present then
        return
      end

      local term_size = {
        width = math.floor(vim.fn.winwidth(0) * 0.85),
        height = math.floor(vim.fn.winheight(0) * 0.45),
      }

      local function term()
        return {
          type = "terminal",
          -- use chafa as preprocessor to print image/gif
          command = [[Chafa.exe ]]
            .. vim.fn.stdpath "config"
            .. [[/assets/370z.gif ]]
            .. [[--animate on --center on --clear ]]
            .. [[--colors full --color-extractor average --color-space din99d ]]
            .. [[--dither diffusion --dither-grain 1 --dither-intensity 1 ]]
            .. [[--duration inf --fill quad,half,hhalf,vhalf,space,solid,block ]]
            .. [[--font-ratio 157/398 --optimize 9 --scale max --speed 25fps ]]
            .. [[--symbols quad,half,hhalf,vhalf ]],
          -- set width and height dynamically
          width = term_size.width,
          height = term_size.height,
          opts = {
            position = "center",
            hl = "String",
          },
        }
      end

      local function button(sc, txt, keybind)
        local sc_ = sc:gsub("%s", ""):gsub("SPC", "<leader>")

        local opts = {
          position = "center",
          text = txt,
          shortcut = sc,
          cursor = 5,
          width = 36,
          align_shortcut = "right",
          hl_shortcut = "Number",
          hl = "Normal",
        }

        if keybind then
          opts.keymap = { "n", sc_, keybind, { noremap = true, silent = true } }
        end

        return {
          type = "button",
          val = txt,
          on_press = function()
            local key = vim.api.nvim_replace_termcodes(sc_, true, false, true)
            vim.api.nvim_feedkeys(key, "normal", false)
          end,
          opts = opts,
        }
      end

      local function subheader()
        local date = os.date " 󰃮 %d/%m/%Y "
        local time = os.date "  %H:%M "
        local plugins = "  " .. require("lazy.stats").stats().count .. " plugins "

        local v = vim.version()
        local version = "  v" .. v.major .. "." .. v.minor .. "." .. v.patch

        local val = date .. time .. plugins .. version

        return {
          type = "text",
          val = val,
          opts = {
            position = "center",
            hl = "Constant",
          },
        }
      end

      local function buttons()
        return {
          type = "group",
          val = {
            button("SPC n", "  New File", ":ene <BAR> startinsert <CR>"),
            button("SPC f", "  Find File", ":Telescope find_files<CR>"),
            button("SPC r", "↺  Recent File", ":Telescope oldfiles<CR>"),
            button("SPC w", "󰮗  Find Word", ":Telescope live_grep<CR>"),
            button("SPC g", "  Open Diff View", ":DiffviewOpen<CR>"),
            button(
              "SPC s",
              "  Open Config",
              ":cd "
                .. vim.fn.stdpath "config"
                .. "| :e ./init.lua"
                .. "| :vsplit ./lua/srv/mappings/init.lua<CR>"
            ),
            button("SPC q", "  Exit Neovim", ":qa!<CR>"),
          },
        }
      end

      require "alpha.term"

      local options = {
        header = term(),
        subheader = subheader(),
        buttons = buttons(),
        -- footer = footer(),
      }

      local config = {
        layout = {
          options.header,
          { type = "padding", val = 5 },
          options.subheader,
          { type = "padding", val = 1 },
          options.buttons,
          { type = "padding", val = 1 },
          options.footer,
        },
      }

      alpha.setup(config)
    end,
  }, -- }}}
}
