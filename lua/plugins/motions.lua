return {
  -- {{{1 abolish.vim: work with several variants of a word at once.
  {
    "tpope/vim-abolish",
    cmd = { "Subvert", "Abolish" },
    keys = function()
      local suffixes = {
        s = "snake_case",
        ["_"] = "snake_case",
        m = "MixedCase",
        p = "MixedCase",
        c = "camelCase",
        u = "UPPER_CASE",
        ["-"] = "kebab-case",
        ["."] = "dot.case",
      }

      local keys = {}
      for key_suffix, desc in pairs(suffixes) do
        table.insert(keys, { "cr" .. key_suffix, mode = { "n", "v" }, desc = desc })
      end
      return keys
    end,
  }, -- }}}

  -- {{{1 Comment.nvim: smart and powerful comment plugin for neovim.
  {
    "numToStr/Comment.nvim",
    keys = {
      { "gc", mode = { "n", "v" } },
      { "gb", mode = { "n", "v" } },
    },
    config = true,
  }, -- }}}

  -- {{{1 flash:nvim: navigate code w/ search labels, enhanced char motions and TS integration
  {
    "folke/flash.nvim",
    -- dependencies = {
    --   { "folke/which-key.nvim", optional = true },
    -- },
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump()
        end,
        desc = "󱐋  Flash",
      },
      {
        "S",
        mode = { "n", "x", "o" },
        function()
          require("flash").treesitter()
        end,
        desc = "󱐋  Flash Treesitter",
      },
      {
        "r",
        mode = "o",
        function()
          require("flash").remote()
        end,
        desc = "󱐋  Remote Flash",
      },
      {
        "R",
        mode = { "o", "x" },
        function()
          require("flash").treesitter_search()
        end,
        desc = "󱐋  Treesitter Search",
      },
      {
        "<c-s>",
        mode = { "c" },
        function()
          require("flash").toggle()
        end,
        desc = "󱐋  Toggle Flash Search",
      },
    },
    opts = {
      jump = { nohlsearch = true },
    },
  }, -- }}}

  -- {{{1 numb.nvim: peek lines just when you intend
  {
    "nacro90/numb.nvim",
    cond = not vim.g.vscode,
    event = "CmdlineEnter",
    opts = { number_only = true }, ---Peek when only if command is a number
  }, -- }}}

  -- {{{1 refactoring.nvim: refactoring library based off the book by Martin Fowler
  {
    "ThePrimeagen/refactoring.nvim",
    cond = not vim.g.vscode,
    keys = {
      {
        "<leader>rr",
        function()
          require("telescope").extensions.refactoring.refactors()
        end,
        desc = "  Code refactor",
        mode = { "n", "x" },
      },
      {
        "<leader>re",
        ":Refactor extract ",
        desc = "  Refactor: generic extract",
        mode = "x",
      },
      {
        "<leader>rf",
        ":Refactor extract_to_file ",
        desc = "  Extract selection to file",
        mode = "x",
      },
      {
        "<leader>rv",
        ":Refactor extract_var ",
        desc = "  Extract selection to variable",
        mode = "x",
      },
      {
        "<leader>ri",
        ":Refactor inline_var",
        desc = "  Replace variables with its value",
        mode = { "n", "x" },
      },
      {
        "<leader>rI",
        ":Refactor inline_func",
        desc = "  Replace function with its value",
        mode = "n",
      },
      {
        "<leader>rb",
        ":Refactor extract_block",
        desc = "  Extract selection to function",
      },
      {
        "<leader>rbf",
        ":Refactor extract_block_to_file",
        desc = "  Extract selection to file",
      },
    },
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-treesitter/nvim-treesitter" },
    },
    -- init = function() require("telescope").load_extension "refactoring" end,
    opts = {
      -- prompt for return type
      prompt_func_return_type = {
        go = true,
        cpp = true,
        c = true,
        java = true,
      },
      -- prompt for function parameters
      prompt_func_param_type = {
        go = true,
        cpp = true,
        c = true,
        java = true,
      },
      printf_statements = {},
      print_var_statements = {},
    },
    config = function(_, opts)
      require("refactoring").setup(opts)

      require("utils.fun").on_load("telescope.nvim", function()
        require("telescope").load_extension "refactoring"
      end)
    end,
  },
  -- }}}

  -- {{{1 nvim-surround: add/change/delete surrounding delimiter pairs with ease.
  { "mini-nvim/mini.surround", enabled = false },
  {
    "kylechui/nvim-surround",
    keys = {
      { "ys" },
      { "yS" },
      { "yss" },
      { "ySS" },
      { "ds" },
      { "cs" },
      { "cS" },
      { "S", mode = "v" },
      { "gS", mode = "v" },
      { "<C-g>s", mode = "i" },
      { "<C-g>S", mode = "i" },
    },
    config = true,
  }, -- }}}
}

-- vim: fdm=marker fdl=0
