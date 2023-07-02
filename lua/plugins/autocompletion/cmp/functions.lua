local ls = require "luasnip"

local M = {}

function M.expand(args)
  ls.lsp_expand(args.body)
end

function M.has_words_before()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0
    and vim.api
        .nvim_buf_get_lines(0, line - 1, line, true)[1]
        :sub(col, col)
        :match "%s"
      == nil
end

function M.format(entry, vim_item)
  local present, lspkind = pcall(require, "lspkind")
  if not present then
    local icons = require("preferences").kind_icons
    -- From kind_icons array
    vim_item.kind =
      -- This concatenates the icons with the name of the item kind
      string.format("%s %s", icons[vim_item.kind], vim_item.kind)
    -- Source
    vim_item.menu = ({
      buffer = "[Buffer]",
      nvim_lsp = "[LSP]",
      luasnip = "[LuaSnip]",
      nvim_lua = "[Lua]",
      latex_symbols = "[LaTeX]",
    })[entry.source.name]
    return vim_item
  else
    local kind =
      lspkind.cmp_format { mode = "symbol_text", maxwidth = 50 }(entry, vim_item)
    local strings = vim.split(kind.kind, "%s", { trimempty = true })
    kind.kind = " " .. (strings[1] or "") .. " "
    kind.menu = "    (" .. (strings[2] or "") .. ")"

    return kind
  end
end

return M
