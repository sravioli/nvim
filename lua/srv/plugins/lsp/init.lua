---@class Fun
local fun = require "srv.utils.fun"

return {
  -- {{{1 neodev.nvim: Neovim setup for init.lua and plugin development
  {
    "folke/neodev.nvim",
    ft = "lua",
    config = true,
  }, -- }}}

  -- {{{1 fidget.nvim: extensible UI for Neovim notifications and LSP progress messages.
  {
    "j-hui/fidget.nvim",
    event = "LspAttach",
    config = true,
  }, -- }}}

  -- {{{1 diagflow.nim: LSP diagnostics in virtual text at the top right of your screen
  {
    "dgagn/diagflow.nvim",
    event = "LspAttach",
    opts = {
      scope = "line",
      padding_right = 2,
      gap_size = 2,
      format = fun.lsp.format_message,

      -- don't update diagnostics when in insert mode.
      toggle_event = { "InsertEnter" },
      render_event = { "CursorMoved" },
      update_event = { "DiagnosticChanged", "BufReadPost" },
    },
  }, -- }}}

  -- {{{1 nvim-lspconfig: Quickstart configs for Nvim LSP
  {
    "neovim/nvim-lspconfig",
    event = require("srv.utils.events").LazyFile,
    dependencies = {
      { "j-hui/fidget.nvim" },
      { "dgagn/diagflow.nvim" },
      { "folke/neodev.nvim" },
    },
    config = function()
      local present, lspconfig = pcall(require, "lspconfig")
      if not present then
        return
      end

      local _border = require("srv.preferences").border

      local on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false

        ---load lsp mappings
        fun.keymaps.load("lsp", { buffer = bufnr })

        ---change diagnostic settings
        vim.diagnostic.config {
          underline = { severity = { min = vim.diagnostic.severity.WARN } },

          virtual_text = false,
          signs = true,

          float = {
            severity_sort = true,
            header = " Diagnostics:",
            source = false,
            format = fun.lsp.format_message,
            prefix = function(diagnostic, i, _)
              local sign, hl = fun.lsp.get_icon(diagnostic.severity)
              return (" %s "):format(sign or i .. "."), hl or ""
            end,
            suffix = function()
              return " "
            end,
          },

          update_in_insert = false,
          severity_sort = true,
        }

        require("lspconfig.ui.windows").default_options = { border = _border }
      end

      local get_capabilities = function()
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        capabilities.offsetEncoding = { "utf-16" }

        capabilities.textDocument = {
          foldingRange = {
            dynamicRegistration = false,
            lineFoldingOnly = true,
          },

          completion = {
            completionItem = {
              documentationFormat = { "markdown", "plaintext" },
              snippetSupport = true,
              preselectSupport = true,
              insertReplaceSupport = true,
              labelDetailsSupport = true,
              deprecatedSupport = true,
              commitCharactersSupport = true,
              tagSupport = { valueSet = { 1 } },
              resolveSupport = {
                properties = {
                  "documentation",
                  "detail",
                  "additionalTextEdits",
                },
              },
            },
          },
        }

        return capabilities
      end

      local handlers = {
        ["textDocument/hover"] = vim.lsp.with(
          vim.lsp.handlers.hover,
          { border = _border }
        ),

        ["textDocument/signatureHelp"] = vim.lsp.with(
          vim.lsp.handlers.signature_help,
          { border = _border, focusable = false, relative = "cursor" }
        ),
      }

      local servers = {
        "lua_ls",
        "marksman",
        "jsonls",
        "taplo",
        "yamlls",
        "clangd",
        "texlab",
        -- "powershell_es",
      }

      local servers_config = require "srv.plugins.lsp.servers"
      for _, lsp in ipairs(servers) do
        lspconfig[lsp].setup {
          on_attach = on_attach,
          capabilities = get_capabilities(),
          handlers = handlers,

          settings = {
            Lua = servers_config.lua_ls,
            texlab = servers_config.texlab,
          },

          marksman = servers_config.marksman,
          jsonls = servers_config.jsonls,
          taplo = servers_config.taplo,
          yamlls = servers_config.yamlls,
          clangd = servers_config.clangd,
          -- powershell_es = servers_config.powershell_es,
        }
      end
    end,
  }, -- }}}

  -- {{{1 POST LSPATTACH
  {
    --~ {{{2 actions-preview.nvim: Fully customizable previewer for LSP code actions.
    {
      "aznhe21/actions-preview.nvim",
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
      "glepnir/lspsaga.nvim",
      dependencies = {
        { "nvim-tree/nvim-web-devicons" },
        { "nvim-treesitter/nvim-treesitter" },
      },
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
            expand_or_jump = { "o", "<CR>" },
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
          border = require("srv.preferences").border,
          code_action = "󰌵 ",
          incoming = "󰁍 ",
          outgoing = " ",
          lines = { "╰", "├", "│", "─", "╭" },
        },
      },

      config = function(_, opts)
        require("lspsaga").setup(opts)
        fun.keymaps.load("lspsaga", { silent = true, remap = true })
      end,
    },
    --~ }}}
  }, -- }}}
}

-- vim: fdm=marker fdl=0

