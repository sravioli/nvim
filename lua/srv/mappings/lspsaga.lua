return {
  plugin = true,

  n = {
    ["<leader>fd"] = { "<cmd>Lspsaga finder<CR>", "  Lspsaga find definition" },
    ["<leader>ca"] = { "<cmd>Lspsaga code_action<CR>", "󱐋  Lspsaga code actions" },
    ["<leader>rn"] = { "<cmd>Lspsaga lsp_rename", "󰑕  Lspsaga rename" },
    ["gd"] = { "<cmd>Lspsaga goto_definition<CR>", "󰞘  Lspsaga definition" },
    ["gT"] = {
      "<cmd>Lspsaga goto_type_definition<CR>",
      "  Lspsaga type definition",
    },

    ["gpd"] = { "<cmd>Lspsaga peek_definition<CR>", "  Lspsaga peek definition" },
    ["gpt"] = {
      "<cmd>Lspsaga peek_type_definition<CR>",
      "  Lspsaga peek type definition",
    },
    ["K"] = { "<cmd>Lspsaga hover_docs<CR>", "󱔗  Lspsaga hover docs" },

    ["<Leader>ci"] = {
      "<cmd>Lspsaga incoming_calls<CR>",
      "  Lspsaga incoming call hierarchy",
    },
    ["<Leader>co"] = {
      "<cmd>Lspsaga outgoing_calls<CR>",
      "  Lspsaga outgoing call hierarchy",
    },

    ["<leader>o"] = { "<cmd>Lspsaga outline<CR>", "󰧮  Lspsaga outline" },
  },

  v = {
    ["<leader>ca"] = { "<cmd>Lspsaga code_action<CR>", "󱐋  Lspsaga code actions" },
  },
}
