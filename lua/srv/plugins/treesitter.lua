return {
  -- {{{1 nvim-treesitter: Nvim Treesitter configurations and abstraction layer.
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
    event = "BufReadPre",
    build = function()
      require("nvim-treesitter.install").update { with_sync = true }
    end,
    opts = {
      ---A list of parser names, or "all" (the five listed parsers should always be installed)
      ensure_installed = {
        "c",
        "lua",
        "vim",
        "vimdoc",
        "query",
        "markdown",
        "markdown_inline",
      },

      ---Install parsers synchronously (only applied to `ensure_installed`)
      sync_install = true,

      ---Automatically install missing parsers when entering buffer
      ---Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
      auto_install = true,

      highlight = {
        enable = true,

        ---Setting this to true will run `:h syntax` and tree-sitter at the same time.
        ---Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        ---Using this option may slow down your editor, and you may see some duplicate
        --.highlights.
        ---Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
      },

      ---Incremental selection based on the named nodes from the grammar.
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "gnn", ---set to `false` to disable one of the mappings
          node_incremental = "grn",
          scope_incremental = "grc",
          node_decremental = "grm",
        },
      },

      ---Indentation based on treesitter for the = operator.
      ---NOTE: This is an experimental feature.
      indent = { enable = true },

      textobjects = {
        select = {
          enable = true,

          ---Automatically jump forward to textobj, similar to targets.vim
          lookahead = true,

          keymaps = {
            ---You can use the capture groups defined in textobjects.scm
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ---You can optionally set descriptions to the mappings (used in the desc parameter
            ---of nvim_buf_set_keymap) which plugins like which-key display
            ["ic"] = {
              query = "@class.inner",
              desc = "Select inner part of a class region",
            },
            ---You can also use captures from other query groups like `locals.scm`
            ["as"] = {
              query = "@scope",
              query_group = "locals",
              desc = "Select language scope",
            },
          },
          ---You can choose the select mode (default is charwise 'v')
          ---
          ---Can also be a function which gets passed a table with the keys
          ---* query_string: eg '@function.inner'
          ---* method: eg 'v' or 'o'
          ---and should return the mode ('v', 'V', or '<c-v>') or a table
          ---mapping query_strings to modes.
          selection_modes = {
            ["@parameter.outer"] = "v", ---charwise
            ["@function.outer"] = "V", ---linewise
            ["@class.outer"] = "<c-q>", ---blockwise
          },
          ---If you set this to `true` (default is `false`) then any textobject is
          ---extended to include preceding or succeeding whitespace. Succeeding
          ---whitespace has priority in order to act similarly to eg the built-in
          ---`ap`.
          ---
          ---Can also be a function which gets passed a table with the keys
          ---* query_string: eg '@function.inner'
          ---* selection_mode: eg 'v'
          ---and should return true of false
          include_surrounding_whitespace = true,
        },
        swap = {
          enable = true,
          swap_next = {
            ["<leader>a"] = "@parameter.inner",
          },
          swap_previous = {
            ["<leader>A"] = "@parameter.inner",
          },
        },
        move = {
          enable = true,
          set_jumps = true, ---whether to set jumps in the jumplist
          goto_next_start = {
            ["]m"] = "@function.outer",
            ["]]"] = { query = "@class.outer", desc = "Next class start" },

            ---You can use regex matching (i.e. lua pattern) and/or pass a list in a
            ---"query" key to group multiple queries.
            ["]o"] = "@loop.*",
            ---["]o"] = { query = { "@loop.inner", "@loop.outer" } }
            ---
            ---You can pass a query group to use query from `queries/<lang>/<query_group>.scm
            ---file in your runtime path. Below example nvim-treesitter's `locals.scm`
            --and `folds.scm`. They also provide highlights.scm and indent.scm.
            ["]s"] = {
              query = "@scope",
              query_group = "locals",
              desc = "Next scope",
            },
            ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
          },
          goto_next_end = {
            ["]M"] = "@function.outer",
            ["]["] = "@class.outer",
          },
          goto_previous_start = {
            ["[m"] = "@function.outer",
            ["[["] = "@class.outer",
          },
          goto_previous_end = {
            ["[M"] = "@function.outer",
            ["[]"] = "@class.outer",
          },
          ---Below will go to either the start or the end, whichever is closer.
          ---Use if you want more granular movements
          ---Make it even more gradual by adding multiple queries and regex.
          goto_next = {
            ["]d"] = "@conditional.outer",
          },
          goto_previous = {
            ["[d"] = "@conditional.outer",
          },
        },
        lsp_interop = {
          enable = true,
          border = require("srv.preferences").border,
          floating_preview_opts = {},
          peek_definition_code = {
            ["<leader>df"] = "@function.outer",
            ["<leader>dF"] = "@class.outer",
          },
        },
      },
    },

    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  }, -- }}}

  -- {{{1 nvim-treesitter-textobjects: syntax aware text-objects.
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    init = function()
      require("srv.utils.fun").on_load("nvim-treesitter", function()
        local ts_repeat_move = require "nvim-treesitter.textobjects.repeatable_move"

        -- Repeat movement with ; and ,
        -- ensure ; goes forward and , goes backward regardless of the last direction
        vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_next)
        vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_previous)

        -- vim way: ; goes to the direction you were moving.
        -- vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
        -- vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)

        -- Optionally, make builtin f, F, t, T also repeatable with ; and ,
        vim.keymap.set(
          { "n", "x", "o" },
          "f",
          ts_repeat_move.builtin_f_expr,
          { expr = true }
        )
        vim.keymap.set(
          { "n", "x", "o" },
          "F",
          ts_repeat_move.builtin_F_expr,
          { expr = true }
        )
        vim.keymap.set(
          { "n", "x", "o" },
          "t",
          ts_repeat_move.builtin_t_expr,
          { expr = true }
        )
        vim.keymap.set(
          { "n", "x", "o" },
          "T",
          ts_repeat_move.builtin_T_expr,
          { expr = true }
        )
      end)
    end,
  }, -- }}}

  -- {{{1 neogen: better annotation generator. Supports multiple languages and conventions.
  {
    "danymat/neogen",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    version = "*",
    keys = {
      {
        "<leader>cgg",
        function()
          require("neogen").generate()
        end,
        desc = "  Generate annotation (auto)",
      },
      {
        "<leader>cgf",
        function()
          require("neogen").generate { type = "func" }
        end,
        desc = "  Generate function annotation",
      },
      {
        "<leader>cgc",
        function()
          require("neogen").generate { type = "class" }
        end,
        desc = "  Generate class annotation",
      },
      {
        "<leader>cgt",
        function()
          require("neogen").generate { type = "type" }
        end,
        desc = "  Generate type annotation",
      },
      {
        "<leader>cgF",
        function()
          require("neogen").generate { type = "file" }
        end,
        desc = "  Generate file annotation",
      },
    },
    opts = {
      snippet_engine = "luasnip",
      languages = {
        lua = { template = { annotation_convention = "emmylua" } },
      },
    },
  }, -- }}}

  -- {{{1 nvim-ufo: not UFO in the sky, but an ultra fold in Neovim.
  {
    "kevinhwang91/nvim-ufo",
    enabled = false,
    dependencies = {
      { "kevinhwang91/promise-async" },
      {
        ---Status column plugin that provides a configurable 'statuscolumn' and click handlers.
        "luukvbaal/statuscol.nvim",
        opts = function()
          local builtin = require "statuscol.builtin"
          return {
            relculright = true,
            segments = {
              { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
              { text = { "%s" }, click = "v:lua.ScSa" },
              { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
            },
          }
        end,
      },
    },
    cmd = {
      "UfoEnable",
      "UfoDisable",
      "UfoInspect",
      "UfoAttach",
      "UfoDetach",
      "UfoEnableFold",
      "UfoDisableFold",
    },
    init = function()
      vim.opt.foldcolumn = "1" -- '0' is not bad
      vim.opt.foldlevel = 99 -- Using ufo provider need a large value
      vim.opt.foldlevelstart = 99
      vim.opt.foldenable = true
      vim.opt.foldmethod = "expr"
    end,
    opts = {
      close_fold_kinds = { "comment", "imports" },

      provider_selector = function(bufnr, filetype, _)
        local fmap = { lua = { "lsp", "treesitter" } }

        return fmap[filetype]
          or function()
            local function handle_fallback_exception(err, providerName)
              if type(err) == "string" and err:match "UfoFallbackException" then
                return require("ufo").getFolds(bufnr, providerName)
              else
                return require("promise").reject(err)
              end
            end

            return require("ufo")
              .getFolds(bufnr, "lsp")
              :catch(function(err)
                return handle_fallback_exception(err, "treesitter")
              end)
              :catch(function(err)
                return handle_fallback_exception(err, "indent")
              end)
          end
      end,

      preview = {
        win_config = {
          winhighlight = "Normal:NormalDark",
          winblend = vim.opt.pumblend:get(),
        },
      },

      enable_get_fold_virt_text = true,
      fold_virt_text_handler = function(virtText, lnum, endLnum, width, truncate)
        local fold_indicator = {}

        local n_lines = endLnum - lnum
        local plural = n_lines == 1 and "" or "s"
        local percentage = n_lines / vim.api.nvim_buf_line_count(0) * 100
        local msg = (" ↙️ %d line%s (%d%%)"):format(n_lines, plural, percentage)
        local msg_width = vim.fn.strdisplaywidth(msg)

        local target_width, current_width = width - vim.fn.strdisplaywidth(msg), 0
        for _, text_chunk in ipairs(virtText) do
          local text, hl = unpack(text_chunk)
          local text_width = vim.fn.strdisplaywidth(text)

          if target_width > current_width + text_width then
            table.insert(fold_indicator, text_chunk)
          else
            text = truncate(text, target_width - current_width)
            table.insert(fold_indicator, { text, hl })

            text_width = vim.fn.strdisplaywidth(text)

            ---string from `truncate()` can be less than 2nd arg => pad it
            if current_width + text_width < target_width then
              msg = msg .. (" "):rep(target_width - current_width - text_width)
            end

            break
          end

          current_width = current_width + text_width
        end

        ---place fold indicator at the colorcolumn/textwidth. if they go off-screen place
        ---the indicator to the closest possible

        local rightmost_col =
          math.max(vim.opt_local.colorcolumn["_value"], vim.opt_local.textwidth["_value"])
        local closest_col = math.min(rightmost_col, width - 1)
        local left_padding = math.max(closest_col - current_width - msg_width, 0)
        local right_padding = 2

        msg = (" "):rep(left_padding - right_padding) .. msg
        table.insert(fold_indicator, { msg, "MoreMsg" })

        return fold_indicator
      end,
    },

    config = function(_, opts)
      require("ufo").setup(opts)
      require("srv.keymaps.ufo"):register()
    end,
  },
  -- }}}
}

-- vim: fdm=marker fdl=0
