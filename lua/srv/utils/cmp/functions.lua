---@module 'srv.utils.cmp.functions'
---@author sravioli
---@license GNU-GPL v3.0

---Utility functions related to `nvim-cmp`
---@class CmpFunctions
local M = {}

---Expands the given luasnip snippet
---@param args any The text to expand
function M.expand(args)
  require("luasnip").lsp_expand(args.body)
end

---Checks if words are present before text to start completing
---@return boolean has_words_before Whether words are present
function M.has_words_before()
  local unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0
    and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s"
      == nil
end

---Formats the autocompletion menu
---@param entry any
---@param vim_item table
function M.format(entry, vim_item)
  local lspkind_present, lspkind = pcall(require, "lspkind")
  if not lspkind_present then
    ---just return the kind
    vim_item.kind = string.format("[%s]", vim_item.kind)

    -- Source
    vim_item.menu = ({
      buffer = "[Buffer]",
      nvim_lsp = "[LSP]",
      luasnip = "[LuaSnip]",
      nvim_lua = "[Lua]",
      latex_symbols = "[LaTeX]",
      path = "[Path]",
    })[entry.source.name]
    return vim_item
  else
    local kind = lspkind.cmp_format {
      mode = "symbol_text",
      maxwidth = 50,
      ellipsis_char = "...",
      preset = "default",
    }(entry, vim_item)

    local strings = vim.split(kind.kind, "%s", { trimempty = true })
    kind.kind = string.format(" %s ", strings[1] or "")
    kind.menu = string.format("    (%s)", strings[2] or "")
    return kind
  end
end

return M
