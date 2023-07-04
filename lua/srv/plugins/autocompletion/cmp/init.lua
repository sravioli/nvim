return {
  ---A completion plugin for neovim coded in Lua.
  "hrsh7th/nvim-cmp",
  dependencies = require "srv.plugins.autocompletion.cmp.dependencies",
  event = { "InsertEnter", "CmdlineEnter" },
  config = function()
    local present, cmp = pcall(require, "cmp")
    if not present then
      return
    end

    local cmp_fn = require "srv.plugins.autocompletion.cmp.functions"
    local cmp_mappings = require "srv.plugins.autocompletion.cmp.mappings"
    local cmp_sources = require "srv.plugins.autocompletion.cmp.sources"

    local opts = {
      experimental = { ghost_text = true },
      completion = { completeopt = "menu,menuone" },
      snippet = { expand = cmp_fn.expand },
      window = {
        completion = {
          winhighlight = "Normal:NormalDark,CursorLine:Visual,Search:None",
          scrollbar = true,
          col_offset = -2, ---with -3 it would randomly clip
          side_padding = 0,
        },
        documentation = {
          winhighlight = "Normal:NormalDark,CursorLine:Visual,Search:None",
        },
      },
      formatting = {
        fields = { "kind", "abbr", "menu" },
        format = cmp_fn.format,
      },
      mapping = cmp.mapping.preset.insert(cmp_mappings),
      sources = cmp_sources.cmp,

      sorting = {
        comparators = {
          function(...)
            return require("cmp_buffer"):compare_locality(...)
          end,
        },
      },
    }

    cmp.setup(opts)

    cmp.setup.cmdline({ "/", "?" }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp_sources.search,
      view = {
        entries = { name = "wildmenu", separator = " | " },
      },
    })

    ---Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    ---`:` cmdline setup.
    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp_sources.cmd,
      view = {
        entries = { name = "wildmenu", separator = " | " },
      },
    })

    ---If you want insert `(` after select function or method item
    local cmp_autopairs = require "nvim-autopairs.completion.cmp"
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
  end,
}
