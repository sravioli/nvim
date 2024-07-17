---@module "srv.keymaps.telescope"
---@author sravioli
---@license GNU-GPLv3

local fun = require "srv.utils.fun"

local Keymap = require "srv.utils.keymap"
local TelescopeKeymaps = Keymap:create() --[[@class Keymap]]

TelescopeKeymaps:add {
  ---find
  {
    "<C-p>",
    function()
      fun.telescope.fd()
    end,
    desc = "Find files",
  },
  {
    "<leader>ff",
    "<cmd>Telescope find_files find_command="
      .. "rg,--ignore,--hidden,--files,--glob,!**/.git/*,--glob,!**/node_modules/*<CR>",
    desc = "Find all files",
  },
  { "<leader>fo", "<cmd>Telescope oldfiles<CR>", desc = "Find old files" },

  ---search
  { "<leader>sw", "<cmd>Telescope live_grep<CR>", desc = "Search word" },
  { "<leader>sh", "<cmd>Telescope help_tags<CR>", desc = "Search help" },
  { "<leader>sH", "<cmd>Telescope highlights<CR>", desc = "Search highlights" },
  { "<leader>sc", "<cmd>Telescope commands<CR>", desc = "Search commands" },
  { "<leader>sa", "<cmd>Telescope autocommands<CR>", desc = "Search autocmds" },
  { "<leader>so", "<cmd>Telescope vim_options<CR>", desc = "Search options" },
  { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Search keymaps" },
  { "<leader>sR", "<cmd>Telescope resume<cr>", desc = "Resume search" },
  {
    "<leader>sb",
    "<cmd>Telescope current_buffer_fuzzy_find<CR>",
    desc = "Search word in buffer",
  },

  ---git
  { "<leader>cm", "<cmd>Telescope git_commits<CR>", desc = "Git commits" },
  { "<leader>gs", "<cmd>Telescope git_status<CR>", desc = "Git status" },
}

TelescopeKeymaps:inject { icon = { icon = " ", color = "cyan" } }
TelescopeKeymaps:register()

return TelescopeKeymaps
