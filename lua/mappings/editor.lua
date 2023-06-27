---@type function
local map = vim.keymap.set

map({ "n", "i" }, "<Esc>", "<Esc>:nohlsearch<CR>", { desc = "Clear highlights" })

-- General mappings
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

-- window movement
map("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })
map("n", "<C-j>", "<C-w>j", { desc = "Move to down window" })
map("n", "<C-k>", "<C-w>k", { desc = "Move to up window" })

map("n", "<C-c>", ":%yank+<CR>", { desc = "Copy whole file" })

-- Allow moving the cursor through wrapped lines with j, k, <Up> and <Down>
-- http://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
-- empty mode is same as using <cmd> :map
-- also don't use g[j|k] when in operator pending mode, so it doesn't alter d, y or c behaviour
map(
  { "n", "x" },
  "j",
  'v:count || mode(1)[0:1] == "no" ? "j" : "gj"',
  { desc = "Move down", expr = true }
)
map(
  { "n", "x" },
  "k",
  'v:count || mode(1)[0:1] == "no" ? "k" : "gk"',
  { desc = "Move up", expr = true }
)
map(
  { "n", "v" },
  "<Up>",
  'v:count || mode(1)[0:1] == "no" ? "k" : "gk"',
  { desc = "Move up", expr = true }
)
map(
  { "n", "v" },
  "<Down>",
  'v:count || mode(1)[0:1] == "no" ? "j" : "gj"',
  { desc = "Move down", expr = true }
)

-- Don't copy the replaced text after pasting in visual mode
-- https://vim.fandom.com/wiki/Replace_a_word_with_yanked_text#Alternative_mapping_for_paste
map(
  "x",
  "p",
  'p:let @+=@0<CR>:let @"=@0<CR>',
  { desc = "Dont copy replaced text", silent = true }
)

map(
  "t",
  "<C-x>",
  vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true),
  { desc = "Escape terminal mode" }
)

map("i", "jk", "<Esc>", { nowait = true, desc = "Exit insert mode" })
map("i", "<C-s>", "<C-o>:w<CR>", { desc = "Save file" })
map("i", "<C-z>", "<C-o>:undo<CR>", { desc = "Undo action" })
map("i", "<M-k>", "<C-o>dd", { desc = "Delete line" })
map("i", "<C-Del>", "<C-o>dw", { desc = "Delete word backwards" })
map("i", "<S-Del>", "<C-o><S-d>", { desc = "Delete from cursor to right" })
map("i", "<M-BS>", "<C-u>", { desc = "Delete from cursor to left" })
