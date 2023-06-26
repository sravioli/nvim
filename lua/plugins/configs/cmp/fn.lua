local cmp = require "cmp"
local ls = require "luasnip"

local fn = {}

function fn.expand(args)
  ls.lsp_expand(args.body)
end

function fn.has_words_before()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0
    and vim.api
        .nvim_buf_get_lines(0, line - 1, line, true)[1]
        :sub(col, col)
        :match "%s"
      == nil
end

function fn.format(entry, vim_item)
  local present, lspkind = pcall(require, "lspkind")
  if not present then
    local icons = require "plugins.configs.cmp-wip.icons"
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

function fn.border(hl_name)
  return {
    { "╭", hl_name },
    { "─", hl_name },
    { "╮", hl_name },
    { "│", hl_name },
    { "╯", hl_name },
    { "─", hl_name },
    { "╰", hl_name },
    { "│", hl_name },
  }
end

fn.mappings = {
  ["<Tab>"] = function(fallback)
    if cmp.visible() then
      cmp.select_next_item()
    -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
    -- this way you will only jump inside the snippet region
    elseif ls.expand_or_jumpable() then
      ls.expand_or_jump()
    elseif fn.has_words_before() then
      cmp.complete()
    else
      fallback()
    end
  end,

  ["<S-Tab>"] = function(fallback)
    if cmp.visible() then
      cmp.select_prev_item()
    elseif ls.jumpable(-1) then
      ls.jump(-1)
    else
      fallback()
    end
  end,

  ["<CR>"] = function(fallback)
    if cmp.visible() and cmp.get_active_entry() then
      cmp.confirm { behavior = cmp.ConfirmBehavior.Replace, select = false }
    else
      fallback()
    end
  end,
}

return fn
