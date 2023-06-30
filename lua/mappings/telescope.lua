return {
  plugin = true,
  n = {
    -- find
    ["<C-p>"] = {
      ":lua require('utils.fn').telescope.fd()<CR>",
      "Find files",
    },
    ["<leader>ff"] = {
      ":Telescope find_files find_command=rg,--ignore,--hidden,--files,--glob,!**/.git/*<CR>",
      "Find all",
    },
    ["<leader>fw"] = { ":Telescope live_grep<CR>", "Live grep" },
    ["<leader>fb"] = { ":Telescope buffers<CR>", "Find buffers" },
    ["<leader>fh"] = { ":Telescope help_tags<CR>", "Help page" },
    ["<leader>fo"] = { ":Telescope oldfiles<CR>", "Find oldfiles" },
    ["<leader>fz"] = {
      ":Telescope current_buffer_fuzzy_find<CR>",
      "Find in current buffer",
    },

    -- git
    ["<leader>cm"] = { ":Telescope git_commits<CR>", "Git commits" },
    ["<leader>gt"] = { ":Telescope git_status<CR>", "Git status" },
  },
}
