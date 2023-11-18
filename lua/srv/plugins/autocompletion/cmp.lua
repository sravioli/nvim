return {
  ---A completion plugin for neovim coded in Lua.
  "hrsh7th/nvim-cmp",
  dependencies = {
    { ---Other plugins
      { "L3MON4D3/LuaSnip" }, ---Snippet Engine for Neovim written in Lua.
      { "onsails/lspkind.nvim" }, ---vscode-like pictograms for neovim lsp completion items
      { "windwp/nvim-autopairs" }, ---autopairs for neovim written by lua
    },
    { ---Autocompletion sources
      { ---Snippets
        { "saadparwaiz1/cmp_luasnip" }, ---luasnip completion source for nvim-cmp
      },
      { ---LSP
        { "hrsh7th/cmp-nvim-lsp" }, ---nvim-cmp source for neovim builtin LSP client
        ---nvim-cmp source for textDocument/documentSymbol via nvim-lsp.
        { "hrsh7th/cmp-nvim-lsp-document-symbol" },
        { "hrsh7th/cmp-nvim-lsp-signature-help" }, ---cmp-nvim-lsp-signature-help
        { "hrsh7th/cmp-nvim-lua" }, ---nvim-cmp source for nvim lua
      },
      { ---Buffer/Vim-builtin functionality
        { "hrsh7th/cmp-buffer" }, ---nvim-cmp source for buffer words
      },
      { ---Filesystem paths
        { "FelipeLema/cmp-async-path" }, ---nvim-cmp source for path (async version)
      },
      { ---Command line
        { "hrsh7th/cmp-cmdline" }, ---nvim-cmp source for vim's cmdline
        ---Source for nvim-cmp which reads results from command-line or search histories
        { "dmitmel/cmp-cmdline-history" },
      },
      { ---Fuzzy finding
        { "lukas-reineke/cmp-rg" }, ---ripgrep source for nvim-cmp
      },
    },
  },
  event = { "InsertEnter", "CmdlineEnter" },

  config = function()
    local cmp = require "cmp"
    local cmp_utils = require "srv.utils.cmp"

    local opts = {
      experimental = { ghost_text = true },
      completion = { completeopt = "menu,menuone" },
      snippet = { expand = cmp_utils.functions.expand },
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
        format = cmp_utils.functions.format,
      },
      mapping = cmp.mapping.preset.insert(cmp_utils.mappings),
      sources = cmp_utils.sources.cmp,

      sorting = {
        comparators = {
          function(...) return require("cmp_buffer"):compare_locality(...) end,
        },
      },
      view = {
        entries = { name = "custom", selection_order = "near_cursor" },
      },
    }

    cmp.setup(opts)

    cmp.setup.cmdline({ "/", "?" }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp_utils.sources.search,
      view = {
        entries = { name = "wildmenu", separator = " | " },
      },
    })

    ---Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work
    ---anymore).
    ---`:` cmdline setup.
    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp_utils.sources.cmd,
      view = {
        entries = { name = "wildmenu", separator = " | " },
      },
    })

    ---If you want insert `(` after select function or method item
    cmp.event:on(
      "confirm_done",
      require("nvim-autopairs.completion.cmp").on_confirm_done()
    )
  end,
}
