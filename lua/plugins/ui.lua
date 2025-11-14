---@class Keymap
local fun = require "utils.fun" ---@class Fun
local prefs = require "utils.prefs" ---@class Preferences
local diag_icons = prefs.icons.diagnostics

return {
  {
    "folke/noice.nvim",
    opts = {
      cmdline = {
        view = "cmdline",
      },

      lsp = {
        progress = { enabled = false },
      },
    },
  },

  {
    "akinsho/bufferline.nvim",
    event = "BufAdd",
    enabled = not vim.g.vscode,
    opts = {
      options = {
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
          local icon = level:match "error" and diag_icons.Error or diag_icons.Warn
          return " " .. icon .. count
        end,

        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            highlight = "Directory",
            text_align = "center",
            separator = true,
          },
        },

        separator_style = "slant",
      },
    },
  },

  -- {{{1 barbar.nvim: the neovim tabline plugin.
  {
    "romgrk/barbar.nvim",
    dependencies = {
      { "lewis6991/gitsigns.nvim" },
      { "nvim-tree/nvim-web-devicons" },
    },
    cond = not vim.g.vscode,
    enabled = false,
    --[[     event = { "BufAdd", "BufNew" }, ]]
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

          separator = { left = "", right = "" },
          preset = "powerline",

          alternate = { filetype = { enabled = false } },
          current = { buffer_index = false },
          inactive = { button = "󰒲" },
          visible = { modified = { buffer_number = true } },
        },
      }
    end,

    -- stylua: ignore
    keys = {
      { "<S-Tab>", "<cmd>BufferPrevious<CR>", desc = "Next", noremap = true, silent = true },
      { "<Tab>", "<cmd>BufferNext<CR>", desc = "Prev", noremap = true, silent = true },

      ---Re-order to previous/next
      { "<leader>bh", "<cmd>BufferMovePrevious<CR>", desc = "Swap w/ left", noremap = true, silent = true },
      { "<leader>bl", "<cmd>BufferMoveNext<CR>", desc = "Swap w/ right", noremap = true, silent = true },

      ---Goto buffer in position...
      { "<leader>b1", "<cmd>BufferGoto 1<CR>", desc = "Jump to buffer 1", noremap = true, silent = true },
      { "<leader>b2", "<cmd>BufferGoto 2<CR>", desc = "Jump to buffer 2", noremap = true, silent = true },
      { "<leader>b3", "<cmd>BufferGoto 3<CR>", desc = "Jump to buffer 3", noremap = true, silent = true },
      { "<leader>b4", "<cmd>BufferGoto 4<CR>", desc = "Jump to buffer 4", noremap = true, silent = true },
      { "<leader>b5", "<cmd>BufferGoto 5<CR>", desc = "Jump to buffer 5", noremap = true, silent = true },
      { "<leader>b6", "<cmd>BufferGoto 6<CR>", desc = "Jump to buffer 6", noremap = true, silent = true },
      { "<leader>b7", "<cmd>BufferGoto 7<CR>", desc = "Jump to buffer 7", noremap = true, silent = true },
      { "<leader>b8", "<cmd>BufferGoto 8<CR>", desc = "Jump to buffer 8", noremap = true, silent = true },
      { "<leader>b9", "<cmd>BufferGoto 9<CR>", desc = "Jump to buffer 9", noremap = true, silent = true },
      { "<leader>b0", "<cmd>BufferLast<CR>", desc = "Jump to last", noremap = true, silent = true },

      ---Pin/unpin buffer
      { "<leader>bP", "<cmd>BufferPin<CR>", desc = "Pin", noremap = true, silent = true },

      ---Close buffer
      { "<leader>bx", "<cmd>BufferClose<CR>", desc = "Close", noremap = true, silent = true },
      { "<leader>bX", group = "+close options", noremap = true, silent = true },
      { "<leader>bXc", "<cmd>BufferCloseAllButCurrent<CR>", desc = "Close all buffers except current", noremap = true, silent = true },
      { "<leader>bXp", "<cmd>BufferCloseAllButPinned<CR>", desc = "Close all buffers except pinned", noremap = true, silent = true },
      { "<leader>bXC", "<cmd>BufferCloseAllButCurrentOrPinned<CR>", desc = "Close all buffers except current/pinned", noremap = true, silent = true },
      { "<leader>bXl", "<cmd>BufferCloseBuffersLeft<CR>", desc = "Close all buffers to the left", noremap = true, silent = true },
      { "<leader>bXr", "<cmd>BufferCloseBuffersRight<CR>", desc = "Close all buffers to the right", noremap = true, silent = true },

      ---Wipeout buffer
      ---                <cmd>BufferWipeout
      ---Close commands
      ---                <cmd>BufferCloseAllButCurrent
      ---                <cmd>BufferCloseAllButPinned
      ---                <cmd>BufferCloseAllButCurrentOrPinned
      ---                <cmd>BufferCloseBuffersLeft
      ---                <cmd>BufferCloseBuffersRight
      ---Magic buffer-picking mode
      { "<leader>bp", "<cmd>BufferPick<CR>", desc = "Pick buffer", noremap = true, silent = true },

      ---Sort automatically by...
      { "<leader>bb", "<cmd>BufferOrderByBufferNumber<CR>", desc = "Re-order buffers by number", noremap = true, silent = true },
      { "<leader>bd", "<cmd>BufferOrderByDirectory<CR>", desc = "Re-order buffers by directory", noremap = true, silent = true },
      { "<leader>bL", "<cmd>BufferOrderByLanguage<CR>", desc = "Re-order buffers by language", noremap = true, silent = true },
      { "<leader>bw", "<cmd>BufferOrderByWindowNumber<CR>", desc = "Re-order buffers by window number", noremap = true, silent = true },
    },
  }, -- }}}

  -- {{{1 dropbar.nvim: IDE-like breadcrumbs, out of the box
  {
    "Bekaboo/dropbar.nvim",
    cond = not vim.g.vscode,
    enabled = not vim.g.vscode or vim.fn.has "nvim-0.10.0" == 1,
    dependencies = { "nvim-telescope/telescope-fzf-native.nvim" },
    event = require("utils.events").LazyFile,
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
      vim.keymap.set("n", "<leader>;", require("dropbar.api").pick, { desc = "Dropbar pick" })
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
      -- stylua: ignore
      local keymaps = {
        { "n", "nzzzv<cmd>lua require('hlslens').start()<CR>", desc = "Next" },
        { "N", "Nzzzv<cmd>lua require('hlslens').start()<CR>", desc = "Prev" },

        { "*", "*zzzv<cmd>lua require('hlslens').start()<CR>", desc = "Search forward under cursor" },
        { "#", "#zzzv<cmd>lua require('hlslens').start()<CR>", desc = "Search backwards under cursor" },
        { "g*", "g*zzzv<cmd>lua require('hlslens').start()<CR>", desc = "Search forward under cursor (not whole word)" },
        { "g#", "g#zzzv<cmd>lua require('hlslens').start()<CR>", desc = "Search backwards under cursor (not whole word)" },

        {
          "<leader>L",
          function()
            vim.schedule(function()
              if require("hlslens").exportLastSearchToQuickfix() then
                vim.cmd "cwindow"
              end
            end)
            return ":nohlsearch<CR>"
          end,
          desc = "Export search results to quickfix",
          expr = true,
          mode = { "n", "x" },
        },
      }

      for _, keymap in ipairs(keymaps) do
        vim.keymap.set(keymap.mode or "n", keymap[1], keymap[2], { desc = keymap.desc, noremap = true, silent = true })
      end
    end,
  }, -- }}}

  -- {{{1 indent-blankline: indent guides for Neovim
  {
    "lukas-reineke/indent-blankline.nvim",
    cond = not vim.g.vscode,
    main = "ibl",
    event = require("utils.events").LazyFile,
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
    event = require("utils.events").LazyFile,
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
}
