return {
  ---Neovim plugin to manage the file system and other tree like structures.
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "nvim-tree/nvim-web-devicons" },
    { "MunifTanjim/nui.nvim" },
    {
      ---Image Preview for Neovim 🖼
      "adelarsq/image_preview.nvim",
      config = true,
    },
    {
      ---This plugins prompts the user to pick a window and returns the window id of
      ---the picked window
      "s1n7ax/nvim-window-picker",
      name = "window-picker",
      version = "2.*",
      opts = {
        hint = "floating-big-letter",
        filter_rules = {
          include_current_win = false,
          autoselect_one = true,
          -- filter using buffer options
          bo = {
            -- if the file type is one of following, the window will be ignored
            filetype = { "neo-tree", "neo-tree-popup", "notify" },
            -- if the buffer type is one of following, the window will be ignored
            buftype = { "terminal", "quickfix" },
          },
        },
      },
    },
  },
  keys = {
    { "<C-n>", "<cmd>Neotree toggle<CR>", desc = "  Toggle Neotree" },
    {
      "<leader>e",
      function()
        local p = vim.fn.expand "%:p"
        if vim.fn.filereadable(p) == 1 then
          vim.cmd(
            "Neotree action=focus source=filesystem position=left reveal_file=" .. p
          )
        end
      end,
      desc = "  Focus Neotree (current file)",
    },
  },
  ---open neo-tree when `nvim .`
  init = function()
    if vim.fn.argc(-1) == 1 then
      ---@diagnostic disable-next-line: param-type-mismatch
      local stat = vim.loop.fs_stat(vim.fn.argv(0))
      if stat and stat.type == "directory" then require "neo-tree" end
    end
  end,
  opts = {
    ---The name used here must be the same name you would use in a require() call.
    sources = { "filesystem", "git_status" },

    ---Add a blank line at the top of the tree.
    add_blank_line_at_top = true,

    ---Automatically clean up broken neo-tree buffers saved in sessions
    auto_clean_after_session_restore = true,

    popup_border_style = require("srv.preferences").border,

    -- use_default_mappings = true,
    use_default_mappings = false,

    source_selector = {
      winbar = true,

      sources = {
        { source = "filesystem", display_name = "  Files " },
        { source = "git_status", display_name = "  Git " },
      },

      -- only with `tabs_layout` = "equal", "focus"
      -- start:  |/ 󰓩 bufname     \/...
      -- end:    |/     󰓩 bufname \/...
      -- center: |/   󰓩 bufname   \/...
      content_layout = "center",

      -- start:  |/  a  \/  b  \/  c  \            |
      -- end:    |            /  a  \/  b  \/  c  \|
      -- center: |      /  a  \/  b  \/  c  \      |
      -- equal:  |/    a    \/    b    \/    c    \|
      -- active: |/  focused tab    \/  b  \/  c  \|
      tabs_layout = "equal",

      truncation_character = "...",

      separator = { left = "", right = "" },

      -- true:  |/  a  \/  b  \/  c  \|
      -- false: |   a  \/  b  \/  c   |
      show_separator_on_edge = true,

      highlight_tab = "NeoTreeTabInactive",
      highlight_tab_active = "NeoTreeTabActive",
      highlight_background = "NeoTreeTabBackground",
      highlight_separator = "NeoTreeTabSeparatorInactive",
      highlight_separator_active = "NeoTreeTabSeparatorActive",
    },

    default_component_configs = {
      indent = {
        ---indent guides
        indent_marker = "│",
        last_indent_marker = "╰",

        ---expander config, needed for nesting files
        with_expanders = nil, ---if nil and file nesting is enabled, will enable expanders
        expander_collapsed = "",
        expander_expanded = "",
        expander_highlight = "NeoTreeExpander",
      },

      -- name = {
      --   trailing_slash = true,
      -- },

      git_status = {
        symbols = {
          ---Change type
          added = require("srv.preferences").icons.git.Added,
          deleted = require("srv.preferences").icons.git.Deleted,
          modified = require("srv.preferences").icons.git.Modified,
          renamed = require("srv.preferences").icons.git.Renamed,

          ---Status type
          untracked = require("srv.preferences").icons.git.Untracked,
          ignored = require("srv.preferences").icons.git.Ignored,
          unstaged = require("srv.preferences").icons.git.Unstaged,
          staged = require("srv.preferences").icons.git.Staged,
          conflict = require("srv.preferences").icons.git.Conflict,
        },
      },
    },

    ---Global custom commands that will be available in all sources (if not overridden
    ---in `opts[source_name].commands`)
    ---
    ---You can then reference the custom command by adding a mapping to it:
    ---   globally    -> `opts.window.mappings`
    ---   locally     -> `opt[source_name].window.mappings` to make it source specific.
    ---
    ---commands = {             | window {                | filesystem {
    ---  hello = function()     |   mappings = {          |   commands = {
    ---    print("Hello world") |     ["<C-c>"] = "hello" |     hello = function()
    ---  end                    |   }                     |       print("in filesystem")
    ---}                        | }                       |     end
    ---
    ---see `:h neo-tree-custom-commands-global`
    commands = { -- A list of functions
      image_wezterm = function(state)
        local node = state.tree:get_node()
        if node.type == "file" then require("image_preview").PreviewImage(node.path) end
      end,
    },

    -- see https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/popup for
    -- possible options. These can also be functions that return these options.
    window = {
      -- Mappings for tree window. See `:h neo-tree-mappings` for a list of built-in
      -- commands. You can also create your own commands by providing a function
      -- instead of a string.
      mapping_options = {
        noremap = true,
        nowait = true,
      },

      mappings = {
        ---HELP
        ["g?"] = { "show_help" },

        ---NAVIGATION
        ["<S-Tab>"] = { "prev_source" },
        ["<Tab>"] = { "next_source" },
        ["<bs>"] = { "navigate_up" },
        ["."] = { "set_root" },
        ["<CR>"] = { "open" },

        ["z"] = {
          "show_help",
          nowait = false,
          config = { title = "node actions", prefix_key = "z" },
        },
        ["za"] = { "toggle_node", nowait = false },
        ["zc"] = { "close_node", nowait = false },
        ["zC"] = { "close_all_subnodes", nowait = false },
        ["zM"] = { "close_all_nodes", nowait = false },
        ["zO"] = { "expand_all_nodes", nowait = false },

        ["K"] = { "toggle_preview", config = { use_float = true, use_image_nvim = true } },
        ["l"] = { "focus_preview" },
        ["<ESC>"] = { "revert_preview" },
        ["q"] = { "revert_preview" },

        ["w"] = {
          "show_help",
          nowait = false,
          config = { title = "open actions", prefix_key = "w" },
        },
        ["wo"] = { "open_with_window_picker", nowait = false },
        ["wv"] = { "vsplit_with_window_picker", nowait = false },
        ["ws"] = { "split_with_window_picker", nowait = false },
        ["t"] = { "open_tabnew" },

        ["]g"] = { "prev_git_modified" },
        ["[g"] = { "next_git_modified" },

        ---FILE ACTIONS
        ["a"] = { "add", config = { show_path = "relative" } },
        ["A"] = { "add_directory", config = { show_path = "relave" } },
        ["d"] = { "delete" },
        ["r"] = { "rename" },
        ["y"] = { "copy_to_clipboard" },
        ["x"] = { "cut_to_clipboard" },
        ["p"] = { "paste_from_clipboard" },
        ["c"] = { "copy", config = { show_path = "relave" } },
        ["m"] = { "move", config = { show_path = "relative" } },

        ---VIEW CHANGES
        ["H"] = { "toggle_hidden" },
        ["R"] = { "refresh" },
      },
    },

    filesystem = {
      window = {
        mappings = {
          ["H"] = { "toggle_hidden" },
          ["/"] = { "fuzzy_finder" },
          ["D"] = { "fuzzy_finder_directory" },
          ["#"] = { "fuzzy_sorter" },
          ["f"] = { "filter_on_submit" },
          ["<C-x>"] = { "clear_filter" },

          ["i"] = { "show_file_details" },

          ["<leader>p"] = { "image_wezterm" },

          [","] = {
            "show_help",
            nowait = false,
            config = { title = "Order by", prefix_key = "," },
          },
          [",c"] = { "order_by_created", nowait = false },
          [",d"] = { "order_by_diagnostics", nowait = false },
          [",m"] = { "order_by_modified", nowait = false },
          [",n"] = { "order_by_name", nowait = false },
          [",s"] = { "order_by_size", nowait = false },
          [",t"] = { "order_by_type", nowait = false },
        },

        ---define keymaps for filter popup window in fuzzy_finder_mode
        fuzzy_finder_mappings = {
          ["<down>"] = "move_cursor_down",
          ["<C-n>"] = "move_cursor_down",
          ["<up>"] = "move_cursor_up",
          ["<C-p>"] = "move_cursor_up",
        },

        ---"auto"   means refreshes are async, but it's synchronous when called from
        ---         the Neotree commands.
        ---"always" means directory scans are always async.
        ---"never"  means directory scans are never async.
        async_directory_scan = "auto",
      },

      ---The renderer section provides the renderers that will be used to render the tree.
      ---  The first level is the node type.
      ---  For each node type, you can specify a list of components to render.
      ---      Components are rendered in the order they are specified.
      ---        The first field in each component is the name of the function to call.
      ---        The rest of the fields are passed to the function as the "config" argument.
      filtered_items = {
        hide_by_name = {
          ".DS_Store",
          "thumbs.db",
          "node_modules",
        },

        ---uses glob style patterns
        hide_by_pattern = {},

        ---remains visible even if other settings would normally hide it
        always_show = { ".gitignored", ".gitignore", ".github" },

        ---remains hidden even if visible is toggled to true, this overrides always_show
        never_show = {},

        ---uses glob style patterns
        never_show_by_pattern = {},
      },

      ---`false` means it only searches the tail of a path.
      ---`true` will change the filter into a full path search with space as an
      ---       implicit ".*", so `fi init` will match: `./sources/filesystem/init.lua
      find_by_full_path_words = true,

      ---"open_default"  - netrw disabled, opening a directory opens neo-tree in
      ---                  whatever position is specified in window.position
      ---"open_current", - netrw disabled, opening a directory opens within the
      ---                  window like netrw would, regardless of window.position
      ---"disabled",     - netrw left alone, neo-tree does not handle opening dirs
      hijack_netrw_behavior = "open_current",

      ---This will use the OS level file watchers to detect changes instead of relying
      ---on nvim autocmd events
      use_libuv_file_watcher = false, ---EPERM error on windows

      ---when true, empty folders will be grouped together
      group_empty_dirs = true,
    },

    git_status = {
      window = {
        mappings = {
          ["g"] = {
            "show_help",
            nowait = false,
            config = { title = "Git actions", prefix_key = "g" },
          },
          ["gA"] = { "git_add_all", nowait = false },
          ["gu"] = { "git_unstage_file", nowait = false },
          ["ga"] = { "git_add_file", nowait = false },
          ["gr"] = { "git_revert_file", nowait = false },
          ["gc"] = { "git_commit", nowait = false },
          ["gp"] = { "git_push", nowait = false },
          ["gg"] = { "git_commit_and_push", nowait = false },

          ["i"] = "show_file_details",

          [","] = {
            "show_help",
            nowait = false,
            config = { title = "Order by", prefix_key = "," },
          },
          [",c"] = { "order_by_created", nowait = false },
          [",d"] = { "order_by_diagnostics", nowait = false },
          [",m"] = { "order_by_modified", nowait = false },
          [",n"] = { "order_by_name", nowait = false },
          [",s"] = { "order_by_size", nowait = false },
          [",t"] = { "order_by_type", nowait = false },
        },
      },
    },
  },
}
