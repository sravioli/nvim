return {
  ---Find the enemy and replace them with dark power.
  "nvim-pack/nvim-spectre",
  keys = {
    {
      "<leader>sr",
      function()
        require("spectre").open()
      end,
      desc = "󰊠  Open Spectre",
    },
    {
      "<leader>sW",
      function()
        require("spectre").open_visual { select_word = true }
      end,
      desc = "󰊠  Search current word",
    },
    {
      "<leader>sW",
      function()
        require("spectre").open_visual()
      end,
      desc = "󰊠  Search current word",
      mode = "v",
    },
    {
      "<leader>sp",
      function()
        require("spectre").open_file_search { select_word = true }
      end,
      desc = "󰊠  Search on current file",
    },
  },
  config = true,
}
