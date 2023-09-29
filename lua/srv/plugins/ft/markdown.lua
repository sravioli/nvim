return {
  {
    ---A markdown preview directly in your neovim.
    "ellisonleao/glow.nvim",
    ft = "markdown",
    keys = {
      { "<leader>fg", "<cmd>Glow<CR>", desc = "  Preview file with Glow" },
    },
    cmd = "Glow",
    opts = {
      border = require("srv.preferences").border,
      width = 85,
      style = "dark",
    },
  },
  {
    ---minimal, opinionated neovim filetype plugin for (La)TeX and Markdown
    "ryleelyman/latex.nvim",
    config = {},
  },
  {
    ---Neovim plugin for Obsidian, written in Lua
    "epwalsh/obsidian.nvim",
    enabled = false,
    -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand':
    event = "BufReadPre "
      .. vim.fn.expand "~"
      .. [[\Documents\knowledge-base\**.md]],
    dependencies = {
      { "nvim-lua/plenary.nvim" }, ---Required.
      { "hrsh7th/nvim-cmp" }, ---Optional, for completion.
      { "nvim-telescope/telescope.nvim" }, ---Optional, for search and quick-switch functionality.

      ---Optional, alternative to nvim-treesitter for syntax highlighting.
      { "godlygeek/tabular" },
      { "preservim/vim-markdown" },
    },
    opts = {
      dir = "~/Documents/knowledge-base/", ---no need to call 'vim.fn.expand' here

      ---Optional, if you keep notes in a specific subdirectory of your vault.
      notes_subdir = "notes",

      ---Optional, set the log level for Obsidian. This is an integer corresponding to one of the log
      ---levels defined by "vim.log.levels.*" or nil, which is equivalent to DEBUG (1).
      log_level = vim.log.levels.DEBUG,

      daily_notes = {
        -- Optional, if you keep daily notes in a separate directory.
        folder = "notes/dailies",
        -- Optional, if you want to change the date format for daily notes.
        date_format = "%Y-%m-%d",
      },

      ---Optional, completion.
      completion = {
        ---If using nvim-cmp, otherwise set to false
        nvim_cmp = true,
        ---Trigger completion at 2 chars
        min_chars = 2,
        ---Where to put new notes created from completion. Valid options are
        --- * "current_dir" - put new notes in same directory as the current buffer.
        --- * "notes_subdir" - put new notes in the default notes subdirectory.
        new_notes_location = "current_dir",
      },

      ---Optional, set to true if you don't want Obsidian to manage frontmatter.
      disable_frontmatter = false,

      ---Optional, for templates (see below).
      templates = {
        subdir = "templates",
        date_format = "%Y-%m-%d-%a",
        time_format = "%H:%M",
      },

      ---Optional, by default when you use `:ObsidianFollowLink` on a link to an external
      ---URL it will be ignored but you can customize this behavior here.
      follow_url_func = function(url)
        ---Open the URL in the default web browser.
        vim.fn.jobstart { "start", url } -- Windows
        -- vim.fn.jobstart { "open", url } -- Mac OS
        -- vim.fn.jobstart({"xdg-open", url})  -- linux
      end,

      ---Optional, set to true if you use the Obsidian Advanced URI plugin.
      ---https://github.com/Vinzent03/obsidian-advanced-uri
      use_advanced_uri = true,

      -- Optional, set to true to force ':ObsidianOpen' to bring the app to the foreground.
      open_app_foreground = false,

      ---Optional, by default commands like `:ObsidianSearch` will attempt to use
      ---telescope.nvim, fzf-lua, and fzf.nvim (in that order), and use the
      ---first one they find. By setting this option to your preferred
      ---finder you can attempt it first. Note that if the specified finder
      ---is not installed, or if it the command does not support it, the
      ---remaining finders will be attempted in the original order.
      finder = "telescope.nvim",
    },
    config = function(_, opts)
      require("obsidian").setup(opts)

      ---Optional, override the 'gf' keymap to utilize Obsidian's search functionality.
      ---see also: 'follow_url_func' config option above.
      vim.keymap.set("n", "gf", function()
        if require("obsidian").util.cursor_on_markdown_link() then
          return "<cmd>ObsidianFollowLink<CR>"
        else
          return "gf"
        end
      end, { noremap = false, expr = true })
    end,
  },
  {
    ---Easily follow markdown links with this neovim plugin
    "jghauser/follow-md-links.nvim",
    ft = "markdown",
    init = function()
      vim.keymap.set("n", "<bs>", ":edit #<cr>", { silent = true })
    end,
  },
  {
    ---Catalyze your Fenced Markdown Code-block editing!
    "AckslD/nvim-FeMaco.lua",
    ft = "markdown",
    keys = {
      {
        "<leader>ce",
        function()
          require("femaco.edit").edit_code_block()
        end,
        desc = "󱚌  Edit code block with FeMaco",
      },
    },
    opts = {
      -- should prepare a new buffer and return the winid
      -- by default opens a floating window
      -- provide a different callback to change this behaviour
      -- @param opts: the return value from float_opts
      prepare_buffer = function(opts)
        local buf = vim.api.nvim_create_buf(false, false)
        return vim.api.nvim_open_win(buf, true, opts)
      end,
      -- should return options passed to nvim_open_win
      -- @param code_block: data about the code-block with the keys
      --   * range
      --   * lines
      --   * lang
      -- float_opts = function(code_block)
      --   return {
      --     relative = "cursor",
      --     width = clip_val(5, 120, vim.api.nvim_win_get_width(0) - 10), -- TODO how to offset sign column etc?
      --     height = clip_val(
      --       5,
      --       #code_block.lines,
      --       vim.api.nvim_win_get_height(0) - 6
      --     ),
      --     anchor = "NW",
      --     row = 0,
      --     col = 0,
      --     style = "minimal",
      --     border = "rounded",
      --     zindex = 1,
      --   }
      -- end,
      -- return filetype to use for a given lang
      -- lang can be nil
      -- ft_from_lang = function(lang)
      --   return lang
      -- end,
      -- what to do after opening the float
      -- post_open_float = function(winnr)
      --   vim.wo.signcolumn = "no"
      -- end,
      -- create the path to a temporary file
      -- create_tmp_filepath = function(filetype)
      --   return os.tmpname()
      -- end,
      -- if a newline should always be used, useful for multiline injections
      -- which separators needs to be on separate lines such as markdown, neorg etc
      -- @param base_filetype: The filetype which FeMaco is called from, not the
      -- filetype of the injected language (this is the current buffer so you can
      -- get it from vim.bo.filetyp).
      ensure_newline = function(base_filetype)
        return true
      end,
    },
  },
}
