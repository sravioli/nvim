return {
  ---Find the enemy and replace them with dark power.
  "nvim-pack/nvim-spectre",
  keys = {
    {
      "<leader>sr",
      ":lua require('spectre').open()<CR>",
      desc = "󰊠  Open Spectre",
    },
    {
      "<leader>sW",
      ":lua require('spectre').open_visual({select_word=true})<CR>",
      desc = "󰊠  Search current word",
    },
    {
      "<leader>sW",
      '<esc>:lua require("spectre").open_visual()<CR>',
      desc = "󰊠  Search current word",
      mode = "v",
    },
    {
      "<leader>sp",
      ':lua require("spectre").open_file_search({select_word=true})<CR>',
      desc = "󰊠  Search on current file",
    },
  },
  config = true,
}
