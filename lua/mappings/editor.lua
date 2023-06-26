local merge_tb = vim.tbl_deep_extend
---@type function
local map = vim.keymap.set

map("n", "<C-s>", ":w<CR>", { desc = "Save file" })
map("n", "<C-z>", ":undo<CR>", { desc = "Undo action" })
map("n", "<C-u>", "<C-u>zz", { desc = "Move half page up" })
map("n", "<C-d>", "<C-d>zz", { desc = "Move half page down" })
map("n", "n", "nzzzv", { desc = "Goto next search match" })
map("n", "N", "Nzzzv", { desc = "Goto prev search match" })
map("n", "]]", "]]zz", { desc = "Move to next {" })
map("n", "[[", "[[zz", { desc = "Move to prev {" })

map("n", "<M-k>", "ddkP", { desc = "Move line up" })
map("n", "<M-j>", "ddp", { desc = "Move line down" })

map("i", "jk", "<Esc>", { nowait = true, desc = "Exit insert mode" })
map("n", "<C-s>", "<C-o>:w<CR>", { desc = "Save file" })
map("n", "<C-z>", "<C-o>:undo<CR>", { desc = "Undo action" })
