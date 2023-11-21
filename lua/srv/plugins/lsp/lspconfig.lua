--# selene: allow(mixed_table)

local lsp_utils = require "srv.utils.lsp"
local servers_config = require "srv.plugins.lsp.servers"

return {
  ---Quickstart configs for Nvim LSP
  "neovim/nvim-lspconfig",
  event = { "BufWinEnter", "BufRead", "BufNewFile" },
  config = function()
    require "srv.plugins.lsp.servers"
  end,
  event = require("srv.utils.event").events.LazyFile,
  dependencies = {
    {
      ---💻 Neovim setup for init.lua and plugin development with full signature help, docs
      ---and completion for the nvim lua API.
      "folke/neodev.nvim",
      enabled = true,
      ft = "lua",
      opts = {
        library = {
          plugins = { "nvim-dap-ui" },
        },
      },
    },
  },
  config = function(_, _)
    local present, lspconfig = pcall(require, "lspconfig")
    if not present then
      return
    end

    local _border = require("srv.preferences").border

    local on_attach = function(client, bufnr)
      client.server_capabilities.documentFormattingProvider = false
      client.server_capabilities.documentRangeFormattingProvider = false

      ---load lsp mappings
      require("srv.utils.keymaps").load("lsp", { buffer = bufnr })

      ---change diagnostic settings
      vim.diagnostic.config {
        underline = { severity = { min = vim.diagnostic.severity.WARN } },

        virtual_text = false,
        signs = true,

        float = {
          severity_sort = true,
          header = " Diagnostics:",
          source = false,
          format = lsp_utils.diagnostic.format,
          prefix = function(diagnostic, i, _)
            local sign, hl = lsp_utils.diagnostic.icon(diagnostic.severity)
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
      ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = _border }),

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
}
