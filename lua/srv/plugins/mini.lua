return {
  -- {{{1 mini.move: move any selection in any direction
  {
    "echasnovski/mini.move",
    version = "*",
    keys = {
      { "<M-h>", mode = { "n", "v" } },
      { "<M-l>", mode = { "n", "v" } },
      { "<M-j>", mode = { "n", "v" } },
      { "<M-k>", mode = { "n", "v" } },
    },
    config = true,
  }, -- }}}

  -- {{{1 mini.splitjoin: split and join arguments
  {
    "echasnovski/mini.splitjoin",
    version = "*",
    keys = { { "<leader>ts" } },
    opts = function()
      local present, sj = pcall(require, "mini.splitjoin")
      if not present then
        return
      end

      return {
        mappings = { toggle = "<leader>ts" },
        join = { hooks_post = sj.gen_hook.pad_brakets },
      }
    end,
  }, -- }}}

  -- {{{1 mini.trailspace: work with trailing whitespace
  {
    "echasnovski/mini.trailspace",
    version = "*",
    event = require("srv.utils.events").LazyFile,
    config = true,
  }, -- }}}

  -- {{{1 mini.align: align text interactively
  {
    "echasnovski/mini.align",
    version = "*",
    keys = {
      { "ga", desc = "align with mini.align" },
      { "gA", desc = "align with mini.align" },
    },
    config = true,
  }, -- }}}

  -- {{{1 mini.ai: Neovim Lua plugin to extend and create `a`/`i` textobjects.
  {
    "echasnovski/mini.ai",
    version = false,
  }, -- }}}

  -- {{{1 mini.operators: Text edit operators.
  {
    "echasnovski/mini.operators",
    version = false,
  }, -- }}}
}

-- vim: fdm=marker fdl=0
