local __border = require("srv.preferences").border

return {
  plugin = true,

  n = {
    ["gD"] = {
      function() vim.lsp.buf.declaration() end,
      "󰞘  LSP declaration",
    },

    ["<leader>K"] = {
      function() vim.lsp.buf.hover() end,
      "󱓂  LSP hover",
    },

    ["gi"] = {
      function() vim.lsp.buf.implementation() end,
      "LSP implementation",
    },

    ["<leader>ls"] = {
      function() vim.lsp.buf.signature_help() end,
      "󰋖  LSP signature help",
    },

    ["<leader>D"] = {
      function() vim.lsp.buf.type_definition() end,
      "LSP definition type",
    },

    ["<leader>ra"] = {
      function() vim.lsp.buf.rename() end,
      "󰑕  LSP rename",
    },

    ["<leader>ca"] = {
      function() vim.lsp.buf.code_action() end,
      "󱐋  LSP code action",
    },

    ["gr"] = {
      function() vim.lsp.buf.references() end,
      "   LSP references",
    },

    ["<leader>f"] = {
      function() vim.diagnostic.open_float { border = __border } end,
      "󱖫  Floating diagnostic",
    },

    ["[d"] = {
      function() vim.diagnostic.goto_prev { float = { border = __border } } end,
      "󰼨  Goto prev",
    },

    ["]d"] = {
      function() vim.diagnostic.goto_next { float = { border = __border } } end,
      "󰼧  Goto next",
    },

    ["<leader>q"] = {
      function() vim.diagnostic.setloclist() end,
      "󱖫  Diagnostic setloclist",
    },

    ["<leader>fm"] = {
      function() vim.lsp.buf.format { async = true } end,
      "󰉢  LSP async formatting",
    },

    ["<leader>wa"] = {
      function() vim.lsp.buf.add_workspace_folder() end,
      "󰉗  Add workspace folder",
    },

    ["<leader>wr"] = {
      function() vim.lsp.buf.remove_workspace_folder() end,
      "󰉘  Remove workspace folder",
    },

    ["<leader>wl"] = {
      function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end,
      "  List workspace folders",
    },
  },
}
