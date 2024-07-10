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
    event = "CmdlineEnter",
    opts = { number_only = true }, ---Peek when only if command is a number
  }, -- }}}

  -- {{{1 refactoring.nvim: refactoring library based off the book by Martin Fowler
  {
    "ThePrimeagen/refactoring.nvim",
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

      require("srv.utils.fun").on_load("telescope.nvim", function()
        require("telescope").load_extension "refactoring"
      end)
    end,
  },
  -- }}}

  -- {{{1 nvim-surround: add/change/delete surrounding delimiter pairs with ease.
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

  -- {{{1 dial.nvim: enhanced increment/decrement plugin for Neovim.
  {
    "monaqa/dial.nvim",
    keys = { --~ {{{2
      {
        "<C-a>",
        function()
          require("dial.map").manipulate("increment", "normal")
        end,
        desc = "Increment",
        mode = "n",
      },
      {
        "<C-x>",
        function()
          require("dial.map").manipulate("decrement", "normal")
        end,
        desc = "Decrement",
        mode = "n",
      },
      {
        "g<C-a>",
        function()
          require("dial.map").manipulate("increment", "gnormal")
        end,
        desc = "Increment",
        mode = "n",
      },
      {
        "g<C-x>",
        function()
          require("dial.map").manipulate("decrement", "gnormal")
        end,
        desc = "Decrement",
        mode = "n",
      },
      {
        "<C-a>",
        function()
          require("dial.map").manipulate("increment", "visual")
        end,
        desc = "Increment",
        mode = "v",
      },
      {
        "<C-x>",
        function()
          require("dial.map").manipulate("decrement", "visual")
        end,
        desc = "Decrement",
        mode = "v",
      },
      {
        "g<C-a>",
        function()
          require("dial.map").manipulate("increment", "gvisual")
        end,
        desc = "Increment",
        mode = "v",
      },
      {
        "g<C-x>",
        function()
          require("dial.map").manipulate("decrement", "gvisual")
        end,
        desc = "Decrement",
        mode = "v",
      },
    }, --~ }}}
    config = function()
      local augend = require "dial.augend"
      local defaults = {
        { "yes", "no" },
        { "true", "false" },
        { "TD", "LR" },
        { "input", "output" },
        { "enable", "disable" },
        { "enabled", "disabled" },
        { "top", "bottom" },
        { "plus", "minus" },
        { "east", "ovest" },
        { "north", "south" },
        { "before", "after" },
        { "sì", "no" },
        { "and", "or", "not" },
        { "begin", "end" },
        { "up", "down" },
        { "left", "right" },
        { "hardware", "software" },
        { "for", "while" },
        { "int", "float" },
        { "minimum", "maximum" },
        { "min", "max" },
        { "==", "!=" },
        { ">", "<" },
        { "+", "-" },
        { "*", "/" },
        { "- [ ]", "- [X]" },
        { "[ ]", "[X]" },
      }

      local elements_list = {}
      for _, elements in ipairs(defaults) do
        for i, element in ipairs(elements) do
          elements[i] = (element:gsub("%u+", string.lower))
        end

        local fst_upper = {}
        for _, element in ipairs(elements) do
          table.insert(fst_upper, (element:gsub("^%l", string.upper)))
        end

        local uppercase = {}
        for _, element in ipairs(elements) do
          table.insert(uppercase, (element:gsub("%l+", string.upper)))
        end

        vim.list_extend(elements_list, { elements, fst_upper, uppercase })
      end

      for i, elements in ipairs(elements_list) do
        defaults[i] =
          augend.constant.new { elements = elements, word = true, cyclic = true }
      end

      -- require("dial.config").augends:register_group {
      --   default = {
      --     augend.integer.alias.decimal,
      --     augend.integer.alias.hex,
      --     augend.date.alias["%Y/%m/%d"],
      --     augend.constant.alias.bool,
      --     augend.semver.alias.semver,
      --   },
      -- }
      require("dial.config").augends:register_group { default = defaults }
    end,
  }, -- }}}

  -- {{{1 nvim-spectre: find the enemy and replace them with dark power.
  {
    "nvim-pack/nvim-spectre",
    keys = {
      {
        "<leader>sr",
        function()
          require("spectre").open()
        end,
        desc = "󰊠  Open Spectre",
      },
      {
        "<leader>sW",
        function()
          require("spectre").open_visual { select_word = true }
        end,
        desc = "󰊠  Search current word",
      },
      {
        "<leader>sW",
        function()
          require("spectre").open_visual()
        end,
        desc = "󰊠  Search current word",
        mode = "v",
      },
      {
        "<leader>sp",
        function()
          require("spectre").open_file_search { select_word = true }
        end,
        desc = "󰊠  Search on current file",
      },
    },
    config = true,
  }, -- }}}

  -- {{{1 mini.nvim: Neovim Lua plugin to extend and create `a`/`i` textobjects.
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
