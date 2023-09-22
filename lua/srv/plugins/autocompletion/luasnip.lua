return {
  ---Snippet Engine for Neovim written in Lua.
  "L3MON4D3/LuaSnip",
  dependencies = { "rafamadriz/friendly-snippets" },
  event = "InsertEnter",
  -- build = "make install_jsregexp",
  build = function()
    local os = require("srv.utils.fn").get_os()
    if os == "win" then
      return ""
    else
      return "make install_jsregexp"
    end
  end,
  config = function()
    local present, ls = pcall(require, "luasnip")
    if not present then
      return
    end

    local opts = {
      history = true,
      update_events = { "TextChanged", "TextChangedI" },
      region_check_events = { "CursorMoved", "CursorHold", "InsertEnter" },
      ---All the LuaSnip nodes that should be included in a snippet file
      snip_env = {
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

    ---lua format
    require("luasnip.loaders.from_lua").load()
    require("luasnip.loaders.from_lua").lazy_load {
      paths = vim.g.lua_snippets_path or "",
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
}
