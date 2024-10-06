local Keymap = require "srv.utils.keymap"
local fun = require "srv.utils.fun"
local prefs = require "srv.preferences"

return {
  -- {{{1 lazydev.nvim: Faster LuaLS setup for Neovim
  {
    "folke/lazydev.nvim",
    cond = not vim.g.vscode,
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "luvit-meta/library", words = { "vim%.uv" } },
        { path = "wezterm-types", mods = { "wezterm" } },
      },
    },
  },
  { "justinsgithub/wezterm-types", lazy = true },
  { "Bilal2453/luvit-meta", lazy = true }, -- optional `vim.uv` typings
  -- }}}

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
            pattern = prefs.spinners.FiraCode,
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

      -- don't update diagnostics when in insert mode.
      toggle_event = { "InsertEnter", "InsertLeave" },
      render_event = { "CursorMoved" },
      update_event = { "DiagnosticChanged", "BufReadPost" },
    },
  }, -- }}}

  -- {{{1 nvim-lspconfig: Quickstart configs for Nvim LSP
  {
    "neovim/nvim-lspconfig",
    cond = not vim.g.vscode,
    event = require("srv.utils.events").LazyFile,
    dependencies = {
      { "williamboman/mason.nvim" },
      { "williamboman/mason-lspconfig.nvim" },
      { "seblj/nvim-lsp-extras" },
      {
        "Decodetalkers/csharpls-extended-lsp.nvim",
        ft = "cs",
        init = function()
          fun.on_load("telescope.nvim", function()
            require("telescope").load_extension "csharpls_definition"
          end)
        end,
      },
    },
    config = function()
      require("mason-lspconfig").setup_handlers {
        function(server)
          local config = vim.tbl_deep_extend("error", {
            capabilities = fun.lsp.capabilities(),
            on_attach = fun.lsp.on_attach,
            handlers = fun.lsp.handlers(),
          }, require("srv.plugins.lsp.servers")[server])

          require("lspconfig")[server].setup(config)
        end,
      }
    end,
  }, -- }}}

  -- {{{1 POST LSPATTACH
  {
    --~ {{{2 actions-preview.nvim: Fully customizable previewer for LSP code actions.
    {
      "aznhe21/actions-preview.nvim",
      cond = not vim.g.vscode,
      dependencies = { "nvim-telescope/telescope.nvim" },
      keys = {
        {
          "<M-.>",
          function()
            require("actions-preview").code_actions()
          end,
          desc = "󱐋  Code action",
          mode = { "i", "n", "v" },
        },
      },
      opts = {
        telescope = {
          sorting_strategy = "ascending",
          layout_strategy = "vertical",
          layout_config = {
            width = 0.8,
            height = 0.9,
            prompt_position = "top",
            preview_cutoff = 20,
            preview_height = function(_, _, max_lines)
              return max_lines - 15
            end,
          },
        },
      },
    }, --~}}}

    --~ {{{2 lsp-lens.nvim: display references & definition infos for functions
    {
      "VidocqH/lsp-lens.nvim",
      cond = not vim.g.vscode,
      event = "LspAttach",
      cmd = { "LspLensOn", "LspLensOff", "LspLensToggle" },
      opts = {
        enable = true,
        include_declaration = true, -- Reference include declaration
        sections = { -- Enable/Disable specific request
          definition = function(count)
            return " " .. count
          end,
          references = function(count)
            return " " .. count
          end,
          implements = function(count)
            return " " .. count
          end,
          git_authors = function(latest_author, count)
            return "  "
              .. latest_author
              .. (count - 1 == 0 and "" or " +" .. count - 1)
          end,
        },
      },
    }, --~ }}}

    --~ {{{2 lspsaga.nvim: improve neovim lsp experience
    {
      "nvimdev/lspsaga.nvim",
      cond = not vim.g.vscode,
      branch = "main",
      event = "LspAttach",
      opts = {
        symbol_in_winbar = { enable = false },
        callhierarchy = {},
        code_action = { enable = false },
        diagnostic = { enable = false },

        finder = {
          min_width = 40,
          keys = {
            expand_or_jump = { "o" },
            vsplit = "S",
            split = "s",
            quit = { "q", "<ESC>" },
          },
        },

        lightbulb = { virtual_text = false },

        outline = {
          win_width = 40,
          preview_width = 0.35,
          auto_resize = true,
          keys = { expand_or_jump = { "<CR>", "o" } },
        },

        rename = { quit = "<Esc>" },

        ui = {
          border = prefs.border,
          code_action = "󰌵 ",
          incoming = "󰁍 ",
          outgoing = " ",
          lines = { "╰", "├", "│", "─", "╭" },
        },
      },

      config = function(_, opts)
        require("lspsaga").setup(opts)
        local keys = Keymap.load "lspsaga"
        keys:register()
      end,
    },
    --~ }}}
  }, -- }}}
}

-- vim: fdm=marker fdl=0
