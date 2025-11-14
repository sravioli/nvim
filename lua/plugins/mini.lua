return {
  -- {{{1 mini.move: move any selection in any direction
  {
    "nvim-mini/mini.move",
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
    "nvim-mini/mini.splitjoin",
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
    "nvim-mini/mini.trailspace",
    version = "*",
    event = require("utils.events").LazyFile,
    config = true,
  }, -- }}}

  -- {{{1 mini.align: align text interactively
  {
    "nvim-mini/mini.align",
    version = "*",
    keys = {
      { "ga", desc = "align with mini.align" },
      { "gA", desc = "align with mini.align" },
    },
    config = true,
  }, -- }}}

  -- {{{1 mini.ai: Neovim Lua plugin to extend and create `a`/`i` textobjects.
  {
    "nvim-mini/mini.ai",
    version = false,
  }, -- }}}

  -- {{{1 mini.operators: Text edit operators.
  {
    "nvim-mini/mini.operators",
    version = false,
  }, -- }}}
}

-- vim: fdm=marker fdl=0
