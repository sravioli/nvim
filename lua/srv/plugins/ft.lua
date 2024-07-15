return {
  -- {{{1 MARKDOWN
  {
    --~ {{{2 glow.nvim: markdown preview directly in neovim.
    {
      "ellisonleao/glow.nvim",
      ft = "markdown",
      keys = {
        { "<leader>fg", "<cmd>Glow<CR>", desc = "  Preview file with Glow" },
      },
      cmd = "Glow",
      opts = {
        border = require("srv.preferences").border,
        width_ratio = 0.9,
        height_ratio = 0.82,
        width = math.floor(vim.opt.columns:get() * 0.9),
        height = math.floor(vim.opt.lines:get() * 0.82),
      },
    }, --~ }}}

    --~ {{{2 vimtex: minimal, opinionated neovim filetype plugin for (La)TeX and Markdown
    {
      "lervag/vimtex",
      ft = "markdown",
      init = function()
        vim.cmd.filetype "plugin indent on"
        vim.cmd.syntax "enable"
        vim.g.vimtex_view_general_viewer = "sioyek"
        vim.g.vimtex_view_general_options =
          "--reuse-window --execute-command toggle_synctex"
      end,
    }, --~ }}}

    --~ {{{2 nvim-FeMaco.lua: catalyze your Fenced Markdown Code-block editing!
    {
      "AckslD/nvim-FeMaco.lua",
      ft = "markdown",
      keys = {
        {
          "<leader>ce",
          function()
            require("femaco.edit").edit_code_block()
          end,
          desc = "Edit code block with FeMaco",
        },
      },
      opts = {
        ensure_newline = function()
          return true
        end,
      },
    }, --~ }}}

    --~ {{{2 nabla.nvim: take your scientific notes ✏️ in Neovim
    {
      "jbyuki/nabla.nvim",
      ft = "markdown",
      keys = {
        {
          "<leader>cp",
          function()
            require("nabla").popup { border = require("srv.preferences").border }
          end,
          desc = "Open Nabla popup",
        },
      },
    }, --~ }}}

    --~ {{{2 vim-ditto: 🙊 Stop repeating yourself
    {
      "dbmrq/vim-ditto",
      ft = { "markdown", "text" },
      keys = {
        { "<leader>tD", "<Plug>ToggleDitto", desc = "Toggle ditto" },
      },
      cmd = {
        "ToggleDitto",
        "Ditto",
        "NoDitto",
        "DittoSent",
        "DittoPar",
        "DittoFile",
      },
      init = function()
        vim.g.ditto_min_word_length = 5
        vim.g.ditto_min_repetitions = 4
        vim.g.ditto_hlgroups = {
          "@punctuation",
          "@constant",
          "@define",
          "@string",
          "@number",
          "@field",
          "@conditional",
          "@type",
        }
        vim.g.ditto_dir = vim.fn.stdpath "config"
        vim.g.ditto_file = ".dittofile"
      end,
    }, --~ }}}

    --~ {{{2 vim-pencil: rethinking Vim as a tool for writing
    {
      "preservim/vim-pencil",
      cmd = { "Pencil", "PencilOff", "PencilToggle", "PencilSoft", "PencilHard" },
      config = function()
        vim.cmd "let g:pencil#wrapModeDefault = 'hard'"
        vim.cmd "let g:pencil#autoformat = 1"
        vim.cmd(
          "let g:pencil#textwidth = "
            .. tonumber(vim.opt_local.colorcolumn["_value"] or 0)
        )
      end,
    }, --~ }}}

    --~ {{{2 markdown-preview.nvim: markdown preview plugin for (neo)vim
    {
      "iamcco/markdown-preview.nvim",
      cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
      build = "cd app && yarn install",
      init = function()
        vim.g.mkdp_filetypes = { "markdown" }
      end,
      ft = { "markdown" },
    }, --~ }}}
  }, -- }}}

  -- {{{1 NU
  --~ {{{2 nvim-nu: Basic editor support for the nushell language
  {
    "LhKipp/nvim-nu",
    ft = "nu",
  }, --~}}}
  -- }}}
}

-- vim: fdm=marker fdl=1
