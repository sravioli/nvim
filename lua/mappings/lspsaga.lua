return {
  plugin = true,

  n = {
    ["<leader>fd"] = { ":Lspsaga lsp_finder<CR>", "Find symbol definition" },

    ["<M-.>"] = { ":Lspsaga code_action<CR>", "Open code actions" },

    ["<leader>rn"] = { ":Lspsaga rename<CR>", "Rename element" },

    ["gd"] = { "<cmd>Lspsaga goto_definition<CR>", "Goto definition" },
    ["gpd"] = { "<cmd>Lspsaga peek_definition<CR>", "Peek definition" },
    ["gpt"] = {
      "<cmd>Lspsaga peek_type_definition<CR>",
      "Peek type definition",
    },
    ["gtd"] = { "<cmd>Lspsaga goto_type_definition<CR>", "Goto type definition" },

    ["K"] = { "<cmd>Lspsaga hover_doc<CR>", "On hover docs" },
    ["<Leader>ci"] = {
      "<cmd>Lspsaga incoming_calls<CR>",
      "Open incoming call hierarchy",
    },
    ["<Leader>co"] = {
      "<cmd>Lspsaga outgoing_calls<CR>",
      "Open outgoing call hierarchy",
    },

    ["<leader>o"] = { "<cmd>Lspsaga outline<CR>", "Open document outline" },
  },

  i = {
    ["<M-.>"] = { "<C-o>:Lspsaga code_action<CR>", "Open code actions" },
  },

  v = {
    ["<M-.>"] = { ":Lspsaga code_action<CR>", "Open code actions" },
  },
}
