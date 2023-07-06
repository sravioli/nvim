return {
  ---mason-nvim-dap bridges mason.nvim with the nvim-dap plugin - making it easier
  ---to use both plugins together.
  "jay-babu/mason-nvim-dap.nvim",
  dependencies = { "williamboman/mason.nvim" },
  cmd = { "DapInstall", "DapUninstall" },
  opts = {
    ---Makes a best effort to setup the various debuggers with
    ---reasonable debug configurations
    automatic_installation = true,

    ---You can provide additional configuration to the handlers,
    ---see mason-nvim-dap README for more information
    handlers = {},

    ensure_installed = {
      -- Update this to ensure that you have the debuggers for the langs you want
    },
  },
}
