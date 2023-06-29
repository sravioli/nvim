local mappings = {
  plugin = true,

  n = {
    ["<C-n>"] = { ":Neotree reveal toggle<CR>", " Toggle Neotree" },
    ["<leader>gs"] = { ":Neotree git_status<CR>", " Open Neotree git status" },
  },
}

return mappings
