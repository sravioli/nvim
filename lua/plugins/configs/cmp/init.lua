local cmp_present, cmp = pcall(require, "cmp")
local ls_present, ls = pcall(require, "luasnip")
if not cmp_present or not ls_present then
  return
end

local fn = require "plugins.configs.cmp.fn"

local opts = {
  completion = { completeopt = "menu,menuone" },
  snippet = { expand = fn.expand },
  window = {
    completion = {
      winhighlight = "Normal:NormalDark,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
      scrollbar = false,
      col_offset = -3,
      side_padding = 0,
    },
    documentation = {
      border = fn.border "FloatBorder",
      winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
    },
  },
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = fn.format,
  },
  mapping = cmp.mapping.preset.insert {
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.abort(),

    ["<Tab>"] = cmp.mapping(fn.mappings["<Tab>"], { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(fn.mappings["<S-Tab>"], { "i", "s" }),
    ["<CR>"] = cmp.mapping(
      cmp.mapping.confirm { select = true, behavior = cmp.ConfirmBehavior.Insert },
      { "i", "c" }
    ),
  },
  sources = cmp.config.sources {
    { name = "nvim_lsp" },
    { name = "nvim_lua" },
    { name = "luasnip" }, -- For luasnip users.
    { name = "luasnip_choice" },
    { name = "buffer" },
    { name = "calc" },
    { name = "async_path" },
    { name = "rg" },
    { name = "doxygen" },
    { name = "nerdfont" },
  },
}

cmp.setup(opts)

-- Set configuration for specific filetype.
cmp.setup.filetype("gitcommit", {
  sources = cmp.config.sources({
    { name = "git" }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
  }, {
    { name = "buffer" },
  }),
})

cmp.setup.cmdline({ "/", "?" }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = "buffer" },
  },
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
-- `:` cmdline setup.
cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = "path" },
  }, {
    {
      name = "cmdline",
      option = {
        ignore_cmds = { "Man", "!" },
      },
    },
  }),
})
