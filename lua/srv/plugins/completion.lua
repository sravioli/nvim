return {
  -- {{{1 nvim-autopairs: autopairs for neovim written in lua
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    cond = not vim.g.vscode,
    opts = {
      disable_filetype = { "TelescopePrompt", "spectre_panel" },
      disable_in_macro = false, ---disable when recording or executing a macro
      disable_in_visualblock = false, ---disable when insert after visual block mode
      disable_in_replace_mode = true,
      ignored_next_char = [=[[%w%%%'%[%"%.%`%$]]=],
      enable_moveright = true,
      enable_afterquote = true, ---add bracket pairs after quote
      enable_check_bracket_line = true, ----check bracket in same line
      enable_bracket_in_quote = true, --
      enable_abbr = false, ---trigger abbreviation
      break_undo = true, ---switch for basic rule break undo sequence
      check_ts = false,
      map_cr = true,
      map_bs = true, ---map the <BS> key
      map_c_h = false, ---Map the <C-h> key to delete a pair
      map_c_w = true, ---map <c-w> to delete a pair if possible
      fast_wrap = {
        map = "<M-e>",
        chars = { "{", "[", "(", '"', "'" },
        pattern = [=[[%'%"%>%]%)%}%,]]=],
        end_key = "$",
        keys = "qwertyuiopzxcvbnmasdfghjkl",
        check_comma = true,
        manual_position = true,
        highlight = "Search",
        highlight_grey = "Comment",
      },
    },
  }, -- }}}

  -- {{{1 LuaSnip: snippet Engine for Neovim written in Lua.
  {
    "L3MON4D3/LuaSnip",
    cond = not vim.g.vscode,
    dependencies = { { "rafamadriz/friendly-snippets" } },
    event = "InsertEnter",
    version = "v2.*",
    build = function()
      local os = require("srv.utils.fun").os_info()[1]
      if os == "windows" then
        return [[gcc ]]
          .. [[-IC:\Users\fsimo\AppData\Local\nvim-data\lazy\LuaSnip\deps\lua51_include\ ]]
          .. [[-O2 -fPIC ]]
          .. [[-c C:\Users\fsimo\AppData\Local\nvim-data\lazy\LuaSnip\deps\jsregexp\jsregexp.c ]]
          .. [[-o jsregexp.o]]
      else
        return "make install_jsregexp"
      end
    end,
    config = function()
      local ls = require "luasnip"

      local function feedkey(key, mode)
        vim.fn.feedkeys(vim.keycode(key), mode or vim.api.nvim_get_mode().mode)
      end

      vim.keymap.set({ "i", "s" }, "<Tab>", function()
        return ls.expand_or_locally_jumpable() and ls.expand_or_jump()
          or feedkey("<Tab>", "n")
      end, { desc = "Luasnip - Jump to next node" })

      vim.keymap.set({ "i", "s" }, "<S-Tab>", function()
        return ls.in_snippet() and ls.jumpable(-1) and ls.jump(-1)
          or feedkey("<S-Tab>", "n")
      end, { desc = "Luasnip - Jump to previous node" })

      local opts = {
        history = true,
        ft_func = require("luasnip.extras.filetype_functions").from_pos_or_filetype,
        load_ft_func = require("luasnip.extras.filetype_functions").extend_load_ft {
          markdown = { "latex", "tex" },
        },
        enable_autosnippets = true,
        update_events = { "TextChanged", "TextChangedI" },
        region_check_events = { "CursorMoved", "CursorHold", "InsertEnter" },
        snip_env = { ---All the LuaSnip nodes that should be included in a snippet file
          s = ls.snippet,
          sn = ls.snippet_node,
          isn = ls.indent_snippet_node,
          t = ls.text_node,
          i = ls.insert_node,
          f = ls.function_node,
          c = ls.choice_node,
          d = ls.dynamic_node,
          r = ls.restore_node,
          events = require "luasnip.util.events",
          ai = require "luasnip.nodes.absolute_indexer",
          extras = require "luasnip.extras",
          l = require("luasnip.extras").lambda,
          rep = require("luasnip.extras").rep,
          p = require("luasnip.extras").partial,
          m = require("luasnip.extras").match,
          n = require("luasnip.extras").nonempty,
          dl = require("luasnip.extras").dynamic_lambda,
          fmt = require("luasnip.extras.fmt").fmt,
          fmta = require("luasnip.extras.fmt").fmta,
          conds = require "luasnip.extras.expand_conditions",
          postfix = require("luasnip.extras.postfix").postfix,
          types = require "luasnip.util.types",
          parse = require("luasnip.util.parser").parse_snippet,
          ms = ls.multi_snippet,
        },
      }

      ls.config.set_config(opts)

      ---lua format
      require("luasnip.loaders.from_lua").load()
      require("luasnip.loaders.from_lua").lazy_load {
        paths = vim.g.lua_snippets_path or "",
      }

      ---vscode format
      require("luasnip.loaders.from_vscode").lazy_load()
      require("luasnip.loaders.from_vscode").lazy_load {
        paths = vim.g.vscode_snippets_path or "",
      }

      ---snipmate format
      require("luasnip.loaders.from_snipmate").load()
      require("luasnip.loaders.from_snipmate").lazy_load {
        paths = vim.g.snipmate_snippets_path or "",
      }

      vim.api.nvim_create_autocmd("InsertLeave", {
        callback = function()
          if
            ls.session.current_nodes[vim.api.nvim_get_current_buf()]
            and not ls.session.jump_active
          then
            ls.unlink_current()
          end
        end,
      })
    end,
  },
  -- }}}

  -- {{{1 nvim-cmp: completion plugin for neovim coded in Lua.
  {
    "hrsh7th/nvim-cmp",
    enabled = false,
    cond = not vim.g.vscode,
    dependencies = {
      { "L3MON4D3/LuaSnip" }, ---Snippet Engine for Neovim written in Lua.
      { "onsails/lspkind.nvim" }, ---vscode-like pictograms for neovim lsp completion items
      { "windwp/nvim-autopairs" }, ---autopairs for neovim written by lua
      { "saadparwaiz1/cmp_luasnip" }, ---luasnip completion source for nvim-cmp
      { "hrsh7th/cmp-nvim-lsp" }, ---nvim-cmp source for neovim builtin LSP client
      ---nvim-cmp source for textDocument/documentSymbol via nvim-lsp.
      { "hrsh7th/cmp-nvim-lsp-document-symbol" },
      { "hrsh7th/cmp-nvim-lsp-signature-help" }, ---cmp-nvim-lsp-signature-help
      { "hrsh7th/cmp-nvim-lua" }, ---nvim-cmp source for nvim lua
      { "hrsh7th/cmp-buffer" }, ---nvim-cmp source for buffer words
      { "FelipeLema/cmp-async-path" }, ---nvim-cmp source for path (async version)
      { "hrsh7th/cmp-cmdline" }, ---nvim-cmp source for vim's cmdline
      ---Source for nvim-cmp which reads results from command-line or search histories
      { "dmitmel/cmp-cmdline-history" },
      { "lukas-reineke/cmp-rg" }, ---ripgrep source for nvim-cmp
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
            function(...)
              return require("cmp_buffer"):compare_locality(...)
            end,
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
  }, -- }}}

  -- {{{1 blink.nvim: Performant, batteries-included completion plugin for Neovim
  {
    "Saghen/blink.cmp",
    enabled = true,
    dependencies = {
      { "L3MON4D3/LuaSnip" },
      { "mikavilpas/blink-ripgrep.nvim" },
    },
    version = "*",
    opts = function()
      local ls = require "luasnip"
      return {
        keymap = {
          ["<C-M-Space>"] = { "show", "show_documentation", "hide_documentation" },
          ["<C-e>"] = { "hide", "fallback" },
          ["<CR>"] = { "accept", "fallback" },

          ["<Tab>"] = { "snippet_forward", "select_next", "fallback" },
          ["<S-Tab>"] = { "snippet_backward", "select_prev", "fallback" },

          ["<C-n>"] = { "select_next", "fallback" },
          ["<C-p>"] = { "select_prev", "fallback" },

          ["<A-p>"] = {
            function()
              if ls.choice_active() then
                ls.change_choice(-1)
              end
            end,
            "fallback",
          },

          ["<A-n>"] = {
            function()
              if ls.choice_active() then
                ls.change_choice(1)
              end
            end,
            "fallback",
          },

          ["<C-b>"] = { "scroll_documentation_up", "fallback" },
          ["<C-f>"] = { "scroll_documentation_down", "fallback" },

          ["<A-1>"] = {
            function(cmp)
              cmp.accept { index = 1 }
            end,
          },
          ["<A-2>"] = {
            function(cmp)
              cmp.accept { index = 2 }
            end,
          },
          ["<A-3>"] = {
            function(cmp)
              cmp.accept { index = 3 }
            end,
          },
          ["<A-4>"] = {
            function(cmp)
              cmp.accept { index = 4 }
            end,
          },
          ["<A-5>"] = {
            function(cmp)
              cmp.accept { index = 5 }
            end,
          },
          ["<A-6>"] = {
            function(cmp)
              cmp.accept { index = 6 }
            end,
          },
          ["<A-7>"] = {
            function(cmp)
              cmp.accept { index = 7 }
            end,
          },
          ["<A-8>"] = {
            function(cmp)
              cmp.accept { index = 8 }
            end,
          },
          ["<A-9>"] = {
            function(cmp)
              cmp.accept { index = 9 }
            end,
          },
        },

        snippets = { preset = "luasnip" },

        completion = {
          keyword = { range = "full" },
          trigger = { show_on_insert_on_trigger_character = false },
          list = { max_items = 150 },
          accept = { auto_brackets = { enabled = true } },

          menu = { border = "rounded" },

          documentation = {
            auto_show = true,
            treesitter_highlighting = true,
            window = { border = "rounded" },
          },
          ghost_text = { enabled = true },
        },
        cmdline = {
          completion = {
            list = { selection = { auto_insert = false } },
            menu = { auto_show = true },
            ghost_text = { enabled = false },
          },
        },

        -- Experimental signature help support
        signature = {
          enabled = true,
          window = { border = "rounded", scrollbar = true },
        },

        fuzzy = {
          sorts = { "label", "kind", "score" },
          prebuilt_binaries = { download = true },
        },

        sources = {
          default = { "lsp", "path", "snippets", "buffer", "ripgrep", "lazydev" },

          -- Please see https://github.com/Saghen/blink.compat for using `nvim-cmp` sources
          providers = {
            snippets = {
              name = "Snippets",
              module = "blink.cmp.sources.snippets",
              score_offset = 99,
            },
            lazydev = {
              name = "LazyDev",
              module = "lazydev.integrations.blink",
              fallbacks = { "lsp" },
            },
            ripgrep = {
              name = "Ripgrep",
              module = "blink-ripgrep",
              score_offset = -90,
              opts = {
                prefix_min_len = 4,
                context_size = 6,
              },
            },
          },
        },

        appearance = {
          use_nvim_cmp_as_default = true,
          nerd_font_variant = "mono",
          kind_icons = {
            Text = " 󰉿 ",
            Method = " 󰆧 ",
            Function = " 󰊕 ",
            Constructor = " 󰒓 ",

            Field = " 󰜢 ",
            Variable = " 󰀫 ",
            Property = " 󰖷 ",

            Class = "  ",
            Interface = "  ",
            Struct = " 󱡠 ",
            Module = " 󰏗 ",

            Unit = "  ",
            Value = " 󰎠 ",
            Enum = "  ",
            EnumMember = "  ",

            Keyword = " 󰌋 ",
            Constant = " 󰏿 ",

            Snippet = "  ",
            Color = " 󰏘 ",
            File = " 󰈔 ",
            Reference = " 󰬲 ",
            Folder = " 󰉋 ",
            Event = " 󱐋 ",
            Operator = " 󰆕 ",
            TypeParameter = " 󰬛 ",
          },
        },
      }
    end,
  }, -- }}}
}

-- vim: fdm=marker fdl=0
