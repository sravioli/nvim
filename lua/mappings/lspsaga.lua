return {
  plugin = true,

  n = {
    ["<leader>fd"] = {
      function()
        require("lspsaga.finder"):lsp_finder()
      end,
      "  Lspsaga find definition",
    },

    ["<M-.>"] = {
      function()
        require("lspsaga.codeaction"):code_action()
      end,
      "󱐋  Lspsaga code actions",
    },

    ["<leader>rn"] = {
      function()
        require("lspsaga.rename"):lsp_rename()
      end,
      "󰑕   Lspsaga rename",
    },

    ["gd"] = {
      function()
        require("lspsaga.definition"):goto_definition(1)
      end,
      "󰞘  Lspsaga definition",
    },
    ["gT"] = {
      function()
        require("lspsaga.definition"):goto_definition(2)
      end,
      "   Lspsaga type definition",
    },

    ["gpd"] = {
      function()
        require("lspsaga.definition"):peek_definition(1)
      end,
      "   Lspsaga peek definition",
    },
    ["gpt"] = {
      function()
        require("lspsaga.definition"):goto_definition(2)
      end,
      "  Lspsaga peek type definition",
    },

    ["K"] = {
      function()
        require("lspsaga.hover"):render_hover_doc()
      end,
      "󱔗  Lspsaga hover docs",
    },

    ["<Leader>ci"] = {
      function()
        require("lspsaga.callhierarchy"):send_method(2)
      end,
      "  Lspsaga incoming call hierarchy",
    },
    ["<Leader>co"] = {
      function()
        require("lspsaga.callhierarchy"):send_method(3)
      end,
      "   Lspsaga outgoing call hierarchy",
    },

    ["<leader>o"] = {
      function()
        require("lspsaga.outline"):outline()
      end,
      "󰧮  Lspsaga outline",
    },
  },

  i = {
    ["<M-.>"] = {
      function()
        require("lspsaga.codeaction"):code_action()
      end,
      "󱐋  Open code actions",
    },
  },

  v = {
    ["<M-.>"] = {
      function()
        require("lspsaga.codeaction"):code_action()
      end,
      "󱐋  Open code actions",
    },
  },
}
