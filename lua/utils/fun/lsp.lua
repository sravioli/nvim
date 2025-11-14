---functions for lsp related stuff
---
---@class Fun.lsp
local M = {}

local _border = require("utils.prefs").border

---Retrieves the diagnostic icon based on the given severity
---@param severity vim.diagnostic.Severity the `:h vim.diagnostic.severity` level
---@return string|nil sign icon corresponding to the severity level. `nil` if not found.
---@return string|nil hl highlight for the icon. `nil` if not found
M.get_icon = function(severity)
  local signs = require("config.prefs").icons.diagnostics
  for type, sign in pairs(signs) do
    if severity == vim.diagnostic.severity[type:upper()] then
      return sign, "DiagnosticSign" .. type
    end
  end
  return nil, nil
end

---Formats the diagnostic message from the LSP or other source.
---@param diagnostic table the `:h diagnostic-structure` table from the LSP.
---@return string fmt the formatted LSP diagnostics message
M.format_message = function(diagnostic)
  local fmt = ""

  local msg = diagnostic.message
  if diagnostic.source then
    msg = msg:gsub("%(" .. diagnostic.source .. "%)", "")
    local source = diagnostic.source:gsub("^[%p%s]*(.-)[%p%s]*$", "%1"):gsub("[%s]", "-"):lower()
    fmt = fmt .. ("%s:"):format(source)
  end

  if diagnostic.code then
    msg = msg:gsub("%[" .. diagnostic.code .. "%]", "")
    fmt = fmt .. (" [%s]"):format(diagnostic.code)
  end

  fmt = fmt .. (" %s"):format(msg)

  return fmt
end

function M.handlers(lsp_name)
  -- Jump directly to the first available definition every time
  -- unless the definitions different line number for some reason.
  -- sumneko_lua sometimes returns same line number but different
  -- column for defintion, so don't care which one we jump to
  -- Thanks to https://github.com/tjdevries/config_manager/blob/master/xdg_config/nvim/lua/tj/lsp/handlers.lua
  return {
    ["textDocument/definition"] = function(_, result, ctx)
      if lsp_name == "csharp_ls" then
        return require("csharpls_extended").handler
      end

      if not result or vim.tbl_isempty(result) then
        return vim.notify "Lsp: Could not find definition"
      end
      local client = vim.lsp.get_client_by_id(ctx.client_id)
      if not client then
        return vim.notify "Lsp: Could not find client"
      end

      if vim.islist(result) then
        local results = vim.lsp.util.locations_to_items(result, client.offset_encoding)
        local lnum, filename = results[1].lnum, results[1].filename
        for _, val in pairs(results) do
          if val.lnum ~= lnum or val.filename ~= filename then
            return require("telescope.builtin").lsp_definitions()
          end
        end
        vim.lsp.util.show_document(result[1], client.offset_encoding)
      else
        vim.lsp.util.show_document(result, client.offset_encoding)
      end
    end,

    ["textDocument/typeDefinition"] = function()
      if lsp_name == "csharp_ls" then
        return require("csharpls_extended").handler
      end
      return vim.lsp.handlers["textDocument/typeDefinition"]
    end,

    ["textDocument/references"] = function(_, _, _)
      require("telescope.builtin").lsp_references()
    end,

    ["textDocument/hover"] = vim.lsp.buf.hover { border = _border },

    ["textDocument/signatureHelp"] = vim.lsp.buf.signature_help {
      border = _border,
      focusable = false,
      relative = "cursor",
    },
  }
end

M.capabilities = function()
  local ok, blink = pcall(require, "blink.cmp")
  local capabilities =
    vim.tbl_deep_extend("force", vim.lsp.protocol.make_client_capabilities(), ok and blink.get_lsp_capabilities() or {})

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

  -- Ensure that dynamicRegistration is enabled! This allows the LS to take into
  -- account actions like the Create Unresolved File code action, resolving
  -- completions for unindexed code blocks, ...
  capabilities.workspace = {
    didChangeWatchedFiles = { dynamicRegistration = true },
  }

  return capabilities
end

M.on_attach = function(client, bufnr)
  client.server_capabilities.documentFormattingProvider = false
  client.server_capabilities.documentRangeFormattingProvider = false

  ---change diagnostic settings
  vim.diagnostic.config {
    underline = { severity = { min = vim.diagnostic.severity.INFO } },

    virtual_text = false,
    signs = true,

    float = {
      severity_sort = true,
      header = " Diagnostics:",
      source = "if_many",
      format = M.format_message,
      prefix = function(diagnostic, i, _)
        local sign, hl = M.get_icon(diagnostic.severity)
        return (" %s "):format(sign or i .. "."), hl or ""
      end,
      suffix = function()
        return " ", ""
      end,
    },

    update_in_insert = false,
    severity_sort = true,
  }

  require("lspconfig.ui.windows").default_options = { border = _border }
end

return M
