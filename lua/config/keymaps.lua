-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = Snacks.keymap.set
local unmap = Snacks.keymap.del

-- {{{1 Editor keymaps

-- NORMAL MODE
map("n", "<Esc>", "<cmd>nohlsearch<CR><Esc>", { desc = "Clear search highlights" })
map("n", "<leader>nfm", "<cmd>lua require('utils.fun').fmt.neorg_create_backlink()<CR>")
map("n", "<C-h>", "<C-w>h", { desc = "Window left" })
map("n", "<C-l>", "<C-w>l", { desc = "Window right" })
map("n", "<C-j>", "<C-w>j", { desc = "Window down" })
map("n", "<C-k>", "<C-w>k", { desc = "Window up" })
map("n", "<C-c>", "<cmd>%yank+<CR>", { desc = "Copy file contents" })
map("n", "<M-a>", "gg0vG$", { desc = "Select whole file" })
map("n", "<leader>tn", "<cmd>set number!<CR>", { desc = "Toggle line number" })
map("n", "<leader>tr", "<cmd>set relativenumber!<CR>", { desc = "Toggle relative number" })
map("n", "<leader>l", "<cmd>Lazy<CR>", { desc = "Open Lazy" })

-- Wrapped line movement
map({ "n", "x" }, "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { desc = "Move down", expr = true })
map({ "n", "x" }, "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { desc = "Move up", expr = true })
map({ "n", "v" }, "<Up>", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { desc = "Move up", expr = true })
map({ "n", "v" }, "<Down>", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { desc = "Move down", expr = true })

-- File actions
map("n", "<C-s>", "<cmd>write<CR>", { desc = "Save File" })
map("n", "<M-s>", "<cmd>noautocmd write<CR>", { desc = "Save File (no autocmds)" })

-- Navigation tweaks
map("n", "<C-u>", "<C-u>zz", { desc = "Move half window up" })
map("n", "<C-d>", "<C-d>zz", { desc = "Move half window down" })
map("n", "n", "nzzzv", { desc = "Next search result" })
map("n", "N", "Nzzzv", { desc = "Prev search result" })
map("n", "]]", "]]zz")
map("n", "[[", "[[zz")

-- Move lines
map("n", "<M-k>", "<cmd>move .-2<CR>==", { desc = "move line up" })
map("n", "<M-j>", "<cmd>move .+1<CR>==", { desc = "move line down" })

-- Select pasted text
map("n", "<leader>p", "`[v`]", { desc = "Select pasted text" })

-- INSERT MODE
map("i", "<Esc>", "<Esc><cmd>nohlsearch<CR>", { desc = "Clear highlights" })
map("i", "jk", "<Esc>", { nowait = true, desc = "Exit insert mode" })
map("i", "<C-s>", "<cmd>write<CR>", { desc = "Save file" })
map("i", "<C-z>", "<cmd>undo<CR>", { desc = "Undo action" })
map("i", "<M-k>", "<cmd>move .-2<CR><C-o>==", { desc = "move line up" })
map("i", "<M-j>", "<cmd>move .+1<CR><C-o>==", { desc = "move line down" })
map("i", "<C-Del>", "<C-o>dw", { desc = "Delete word backwards" })
map("i", "<S-Del>", "<C-o><S-d>", { desc = "Delete everything from cursor to right" })
map("i", "<M-BS>", "<C-u>", { desc = "Delete everything from cursor to left" })

-- Undo break-points
map("i", ",", ",<C-g>u", { desc = "Add undo break-points" })
map("i", ".", ".<C-g>u", { desc = "Add undo break-points" })
map("i", ";", ";<C-g>u", { desc = "Add undo break-points" })
map("i", " ", " <C-g>u", { desc = "Add undo break-points" })

-- TERMINAL MODE
map("t", "<Esc>", "<C-\\><C-n>", { desc = "Escape terminal mode" })
map("t", "jk", "<C-\\><C-n>", { desc = "Escape terminal mode" })

-- VISUAL MODE
map("v", "<M-k>", ":move '<-2<CR>gv=gv", { desc = "move line up" })
map("v", "<M-j>", ":move '>+1<CR>gv=gv", { desc = "move line down" })

-- VISUAL/SELECT MODE
map("x", "p", 'p:let @+=@0<CR>:let @"=@0<CR>', { desc = "Dont copy replaced text", silent = true })
-- }}}

-- vim: fdm=marker fdl=0
