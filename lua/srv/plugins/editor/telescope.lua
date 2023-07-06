return {
  ---Find, Filter, Preview, Pick. All lua, all the time.
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  branch = "0.1.x",
  cmd = "Telescope",
  keys = {
    ---find
    {
      "<C-p>",
      "<cmd>lua require('srv.utils.fn').telescope.fd()<CR>",
      desc = "  Find files",
    },
    {
      "<leader>ff",
      "<cmd>Telescope find_files find_command="
        .. "rg,--ignore,--hidden,--files,--glob,!**/.git/*,--glob,**/node_modules/*<CR>",
      desc = "  Find all files",
    },
    { "<leader>fo", "<cmd>Telescope oldfiles<CR>", desc = "  Find old files" },
    ---search
    { "<leader>sw", "<cmd>Telescope live_grep<CR>", desc = "  Search word" },
    { "<leader>sh", "<cmd>Telescope help_tags<CR>", desc = "  Search help" },
    { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "  Search keymaps" },
    { "<leader>sR", "<cmd>Telescope resume<cr>", desc = "  Resume search" },
    {
      "<leader>sb",
      "<cmd>Telescope current_buffer_fuzzy_find<CR>",
      desc = "  Search word in buffer",
    },

    ---git
    -- { "<leader>cm", "<cmd>Telescope git_commits<CR>", desc = "  Git commits" },
    -- { "<leader>gt", "<cmd>Telescope git_status<CR>", desc = "  Git status" },
  },
  config = function()
    local present, telescope = pcall(require, "telescope")
    if not present then
      return
    end

    local opts = {
      defaults = {
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
        preview = {
          mime_hook = require("srv.utils.fn").telescope.preview_img,
        },
        prompt_prefix = "   ",
        selection_caret = "  ",
        entry_prefix = "  ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
        layout_config = {
          horizontal = {
            prompt_position = "top",
            preview_width = 0.55,
            results_width = 0.8,
          },
          vertical = {
            mirror = false,
          },
          width = 0.87,
          height = 0.80,
          preview_cutoff = 120,
        },
        file_sorter = require("telescope.sorters").get_fuzzy_file,
        file_ignore_patterns = { "node_modules" },
        generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
        path_display = { "truncate" },
        winblend = 0,
        borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        color_devicons = true,
        set_env = { ["COLORTERM"] = "truecolor" }, ---default = nil,
        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        ---file_previewer = require("telescope.previewers").cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
        ---Developer configurations: Not meant for general override
        buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
        ---buffer_previewer_maker = require("srv.utils.fn").telescope.buffer_previewer,
        mappings = {
          n = {
            ["q"] = require("telescope.actions").close,
            ["<M-p>"] = require("telescope.actions.layout").toggle_preview,
          },
          i = {
            ["<M-p>"] = require("telescope.actions.layout").toggle_preview,
          },
        },
      },
      extensions = {
        fzf = {
          fuzzy = true, ---false will only do exact matching
          override_generic_sorter = true, ---override the generic sorter
          override_file_sorter = true, ---override the file sorter
          case_mode = "smart_case", ---or "ignore_case" or "respect_case"
          ---the default case_mode is "smart_case"
        },
      },
    }

    telescope.setup(opts)
    telescope.load_extension "fzf"
  end,
}
