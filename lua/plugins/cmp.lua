return {
  -- {{{1 LuaSnip: snippet Engine for Neovim written in Lua.
  {
    "L3MON4D3/LuaSnip",
    cond = not vim.g.vscode,
    dependencies = { { "rafamadriz/friendly-snippets" } },
    event = "InsertEnter",
    version = "v2.*",
    build = "make install_jsregexp",
    config = function()
      local ls = require "luasnip"

      local function feedkey(key, mode)
        vim.fn.feedkeys(vim.keycode(key), mode or vim.api.nvim_get_mode().mode)
      end

      vim.keymap.set({ "i", "s" }, "<Tab>", function()
        return ls.expand_or_locally_jumpable() and ls.expand_or_jump() or feedkey("<Tab>", "n")
      end, { desc = "Luasnip - Jump to next node" })

      vim.keymap.set({ "i", "s" }, "<S-Tab>", function()
        return ls.in_snippet() and ls.jumpable(-1) and ls.jump(-1) or feedkey("<S-Tab>", "n")
      end, { desc = "Luasnip - Jump to previous node" })

      vim.keymap.set("n", "<leader>sP", function()
        require("luasnip.loaders").edit_snippet_files()
      end)

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
          if ls.session.current_nodes[vim.api.nvim_get_current_buf()] and not ls.session.jump_active then
            ls.unlink_current()
          end
        end,
      })
    end,
  },
  -- }}}

  {
    "saghen/blink.cmp",
    dependencies = {
      { "L3MON4D3/LuaSnip" },
      { "mikavilpas/blink-ripgrep.nvim" },
      { "xzbdmw/colorful-menu.nvim" },
    },
    version = "1.*",

    init = function()
      -- vim.api.nvim_set_hl(0, "BlinkCmpMenu", { link = ""})
    end,

    opts = function()
      local ls = require "luasnip"

      ---@module 'blink.cmp'
      ---@type blink.cmp.Config
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

          menu = {
            border = "rounded",
            draw = {
              columns = { { "kind_icon" }, { "label", gap = 1 } },
              components = {
                label = {
                  text = function(ctx)
                    return require("colorful-menu").blink_components_text(ctx)
                  end,
                  highlight = function(ctx)
                    return require("colorful-menu").blink_components_highlight(ctx)
                  end,
                },
              },
            },
          },

          documentation = {
            auto_show = true,
            treesitter_highlighting = true,
            auto_show_delay_ms = 150,
            window = { border = "rounded" },
          },

          ghost_text = { enabled = true },
        },

        sources = {
          default = {
            "lsp",
            "path",
            "snippets",
            "buffer",
            -- "ripgrep"
            -- "lazydev",
          },
        },
      }
    end,
  },
}
