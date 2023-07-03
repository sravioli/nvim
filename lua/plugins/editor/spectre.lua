return {
  ---Find the enemy and replace them with dark power.
  "nvim-pack/nvim-spectre",
  keys = {
    {
      "<leader>S",
      ":lua require('spectre').open()<CR>",
      desc = "󰊠  Open Spectre",
    },
    {
      "<leader>sw",
      ":lua require('spectre').open_visual({select_word=true})<CR>",
      desc = "󰊠  Search current word",
    },
    {
      "<leader>sw",
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
