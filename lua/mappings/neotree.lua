local mappings = {
  plugin = true,

  n = {
    ["<C-n>"] = { ":NeoTreeRevealToggle<CR>", "Open Neotree" },
    ["<leader>gs"] = { ":Neotree git_status<CR>", "Open Neotree git status" },
  },
}

return mappings
