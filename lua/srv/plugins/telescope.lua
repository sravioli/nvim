local fun = require "srv.utils.fun" ---@class Fun
return {
  -- {{{1 telescope-fzf-native.nvim:
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    enabled = vim.fn.executable "make" == 1,
    config = function()
      fun.on_load("telescope.nvim", function()
        require("telescope").load_extension "fzf"
      end)

      ---since nvim-0.10.0, :Telescope find_files opens file in insert mode, this fixes it
      vim.api.nvim_create_autocmd("WinLeave", {
        callback = function()
          if vim.bo.ft == "TelescopePrompt" and vim.fn.mode() == "i" then
            vim.api.nvim_feedkeys(
              vim.api.nvim_replace_termcodes("<Esc>", true, false, true),
              "i",
              false
            )
          end
        end,
      })
    end,
  }, -- }}}

  -- {{{1 telescope.nvim: find, Filter, Preview, Pick. All lua, all the time.
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-treesitter/nvim-treesitter" },
      { "nvim-tree/nvim-web-devicons" },
      { "nvim-telescope/telescope-fzf-native.nvim" },
    },
    branch = "0.1.x",
    cmd = "Telescope",
    keys = require("srv.keymaps.telescope"):lazy_handler(),

    opts = function()
      local present, _ = pcall(require, "telescope")
      if not present then
        return
      end

      return {
        defaults = {
          layout_strategy = "flex", ---swaps between `horizontal` and `vertical`

          layout_config = {
            horizontal = { preview_width = 0.55 },
            vertical = { mirror = false },
            width = 0.87,
            height = 0.80,
            preview_cutoff = 120,
          },

          winblend = vim.opt.pumblend:get(),
          prompt_prefix = "   ",
          selection_caret = "󰁔 ",

          -- path_display = { shorten = { len = 2, exclude = { 1, -1 } } },

          mappings = {
            i = {
              ["<C-j>"] = {
                require("telescope.actions").move_selection_next,
                type = "action",
                opts = { nowait = true, silent = true },
              },

              ["<C-k>"] = {
                require("telescope.actions").move_selection_previous,
                type = "action",
                opts = { nowait = true, silent = true },
              },

              ["<M-p>"] = require("telescope.actions.layout").toggle_preview,

              ["<C-n>"] = require("telescope.actions").cycle_history_next,
              ["<C-p>"] = require("telescope.actions").cycle_history_prev,
            },

            n = {
              ["q"] = require("telescope.actions").close,
              ["<M-p>"] = require("telescope.actions.layout").toggle_preview,
            },
          },

          preview = { check_mime_type = true },

          vimgrep_arguments = {
            "rg",
            "--follow",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
          },

          set_env = { COLORTERM = "truecolor" },

          color_devicons = true,
        },

        -- pickers = {},

        extensions = {
          fzf = {
            ---false will only do exact matching
            fuzzy = true,

            ---override the generic sorter
            override_generic_sorter = true,

            ---override the file sorter
            override_file_sorter = true,

            ---or "ignore_case" or "respect_case", the default case_mode is "smart_case"
            case_mode = "smart_case",
          },
        },
      }
    end,
  }, -- }}}

  -- {{{1 nerdy.nvim: Find Nerd Glyphs Easily 🤓🔭
  {
    "2kabhishek/nerdy.nvim",
    cmd = "Nerdy",
    keys = {
      { "<leader>si", "<cmd>Nerdy<CR>", desc = "Search nerd icons" },
    },
  }, -- }}}
}
