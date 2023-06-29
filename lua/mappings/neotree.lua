return {
  plugin = true,

  n = {
    ["<C-n>"] = { ":Neotree reveal toggle<CR>", "  Toggle Neotree" },
    ["<leader>e"] = { ":Neotree focus<CR>", "  Focus Neotree" },
    ["<leader>gs"] = { ":Neotree git_status<CR>", "  Neotree git status" },
  },
}
