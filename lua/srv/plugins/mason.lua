return {
  -- {{{1 mason-lspconfig.nvim: extends mason.nvim to make it easier to use lspconfig w/ it
  {
    ---Extension to mason.nvim that makes it easier to use lspconfig with mason.nvim.
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    cmd = { "LspInstall", "LspUninstall" },
    opts = {
      ---A list of servers to automatically install if they're not already
      ---installed. Example: { "rust_analyzer@nightly", "lua_ls" }
      ---This setting has no relation with the `automatic_installation` setting.
      ---@type string[]
      ensure_installed = {
        "bash-language-server",
        "json-lsp",
        "lua-language-server",
        "markdown-oxide",
        "marksman",
        "taplo",
        "yaml-language-server",
      },

      ---Whether servers that are set up (via lspconfig) should be automatically
      ---installed if they're not already installed.
      ---This setting has no relation with the `ensure_installed` setting.
      ---Can either be:
      ---  - false: Servers are not automatically installed.
      ---  - true: All servers set up via lspconfig are automatically installed.
      ---  - { exclude: string[] }: All servers set up via lspconfig, except the
      ---    ones provided in the list, are automatically installed.
      ---
      ---Example: automatic_installation = { exclude = { "rust_analyzer", "solargraph" } }
      ---@type boolean
      automatic_installation = true,

      ---See `:h mason-lspconfig.setup_handlers()`
      ---@type table<string, fun(server_name: string)>?
      handlers = nil,
    },
  }, -- }}}

  -- {{{1 mason.nvim: portable package manager for Neovim that runs everywhere Neovim runs.
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    cmd = {
      "Mason",
      "MasonInstall",
      "MasonUninstall",
      "MasonUninstallAll",
      "MasonLog",
    },
    opts = {
      ui = {
        icons = {
          package_pending = " ",
          package_installed = "󰄳 ",
          package_uninstalled = " 󰚌",
        },
        border = require("srv.preferences").border,

        keymaps = {
          toggle_server_expand = "<CR>",
          install_server = "i",
          update_server = "u",
          check_server_version = "c",
          update_all_servers = "U",
          check_outdated_servers = "C",
          uninstall_server = "X",
          cancel_installation = "<C-c>",
        },
      },

      max_concurrent_installers = 10,
    },
  }, -- }}}
}

-- vim: fdm=marker fdl=0
