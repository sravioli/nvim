local present, cmp = pcall(require, "cmp")
if not present then
  return
end

local cmp_fn = require "plugins.configs.cmp.functions"
local cmp_mappings = require "plugins.configs.cmp.mappings"
local cmp_sources = require "plugins.configs.cmp.sources"

local opts = {
  completion = { completeopt = "menu,menuone" },
  snippet = { expand = cmp_fn.expand },
  window = {
    completion = {
      winhighlight = "Normal:NormalDark,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
      scrollbar = true,
      col_offset = -3,
      side_padding = 0,
    },
    documentation = {
      border = cmp_fn.border "FloatBorder",
      winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
    },
  },
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = cmp_fn.format,
  },
  mapping = cmp.mapping.preset.insert(cmp_mappings),
  sources = cmp.config.sources(cmp_sources),
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

-- If you want insert `(` after select function or method item
local cmp_autopairs = require "nvim-autopairs.completion.cmp"
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
