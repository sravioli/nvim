---@module "lua.srv.mappings.editor"
---@author sravioli
---@license GNU-GPLv3

local Keymap = require "srv.utils.keymap"
local EditorKeymaps = Keymap:create() --[[@class Keymap]]

EditorKeymaps:add {
  -- {{{1 NORMAL MODE
  { "<Esc>", "<cmd>nohlsearch<CR><Esc>", desc = "Clear search highlights", icon = "" },

  ---switch between windows
  { "<C-h>", "<C-w>h", desc = "Window left", icon = "" },
  { "<C-l>", "<C-w>l", desc = "Window right", icon = "" },
  { "<C-j>", "<C-w>j", desc = "Window down", icon = "" },
  { "<C-k>", "<C-w>k", desc = "Window up", icon = "" },

  ---Copy all
  { "<C-c>", "<cmd>%yank+<CR>", desc = "Copy file contents", icon = "" },

  ---Select all
  { "<M-a>", "gg0vG$", desc = "Select whole file", icon = "󰒉" },

  ---line numbers
  { "<leader>tn", "<cmd>set number!<CR>", desc = "Toggle line number", icon = "󰔡" },
  {
    "<leader>tr",
    "<cmd>set relativenumber!<CR>",
    desc = "Toggle relative number",
    icon = "󰔡",
  },

  { "<leader>l", "<cmd>Lazy<CR>", desc = "Open Lazy", icon = "󰒲" },

  ---Allow moving the cursor through wrapped lines with j, k, <Up> and <Down>
  ---http://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
  ---empty mode is same as using <cmd> :map
  ---also don't use g[j|k] when in operator pending mode, so it doesn't alter d, y or c
  ---behaviour
  {
    "j",
    'v:count || mode(1)[0:1] == "no" ? "j" : "gj"',
    desc = "Move down",
    icon = "",
    expr = true,
    mode = { "x", "n" },
  },
  {
    "k",
    'v:count || mode(1)[0:1] == "no" ? "k" : "gk"',
    desc = "Move up",
    icon = "",
    expr = true,
    mode = { "x", "n" },
  },
  {
    "<Up>",
    'v:count || mode(1)[0:1] == "no" ? "k" : "gk"',
    desc = "Move up",
    icon = "",
    expr = true,
    mode = { "n", "v" },
  },
  {
    "<Down>",
    'v:count || mode(1)[0:1] == "no" ? "j" : "gj"',
    desc = "Move down",
    icon = "",
    expr = true,
    mode = { "n", "v" },
  },

  { "<C-s>", "<cmd>write<CR>", desc = "Save File", icon = "󰆓" },
  {
    "<M-s>",
    "<cmd>noautocmd write<CR>",
    desc = "Save File (no autocmds)",
    icon = "󰆓",
  },
  { "<C-z>", "<cmd>undo<CR>", desc = "Undo action", icon = "" },

  ---do thing, then center screen to allow for better readability
  { "<C-u>", "<C-u>zz", desc = "Move half window up", icon = "" },
  { "<C-d>", "<C-d>zz", desc = "Move half window down", icon = "" },
  { "n", "nzzzv", desc = "Next search result", icon = "󰒭" },
  { "N", "Nzzzv", desc = "Prev search result", icon = "󰒮" },
  { "]]", "]]zz" },
  { "[[", "[[zz" },

  { "<M-k>", "<cmd>move .-2<CR>==", desc = "move line up", icon = "" },
  { "<M-j>", "<cmd>move .+1<CR>==", desc = "move line down", icon = "" },

  ---select just pasted text
  { "<leader>p", "`[v`]", desc = "Select pasted text", icon = "󰒅" },
  -- }}}

  -- {{{1 INSERT MODE
  { "<Esc>", "<Esc><cmd>nohlsearch<CR>", desc = "Clear highlights", mode = "i" },
  { "jk", "<Esc>", desc = "Exit insert mode", nowait = true, mode = "i" },

  ---same normal mappings for insert mode also
  { "<C-s>", "<cmd>write<CR>", desc = "Save file", icon = "󰆓", mode = "i" },
  { "<C-z>", "<cmd>undo<CR>", desc = "Undo action", icon = "", mode = "i" },

  ---Move lines
  {
    "<M-k>",
    "<cmd>move .-2<CR><C-o>==",
    desc = "move line up",
    icon = "",
    mode = "i",
  },
  {
    "<M-j>",
    "<cmd>move .+1<CR><C-o>==",
    desc = "move line down",
    icon = "",
    mode = "i",
  },

  ---C-w but backwards
  { "<C-Del>", "<C-o>dw", desc = "Delete word backwards", icon = "󰭜", mode = "i" },
  {
    "<S-Del>",
    "<C-o><S-d>",
    desc = "Delete everything from cursor to right",
    icon = "󰭜",
    mode = "i",
  },
  {
    "<M-BS>",
    "<C-u>",
    desc = "Delete everything from cursor to left",
    icon = "󰹿",
    mode = "i",
  },

  -- ["<C-S-v>"] = { "<C-o>p" },

  ---undo break-points
  { ",", ",<C-g>u", desc = "Add undo break-points", icon = "󰕌", mode = "i" },
  { ".", ".<C-g>u", desc = "Add undo break-points", icon = "󰕌", mode = "i" },
  { ";", ";<C-g>u", desc = "Add undo break-points", icon = "󰕌", mode = "i" },
  { " ", " <C-g>u", desc = "Add undo break-points", icon = "󰕌", mode = "i" },
  -- }}}

  -- {{{1 TERMINAL MODE
  { "<Esc>", "<C-\\><C-n>", desc = "Escape terminal mode", icon = "󰩈", mode = "t" },
  { "jk", "<C-\\><C-n>", desc = "Escape terminal mode", icon = "󰩈", mode = "t" },
  -- }}}

  -- {{{1 VISUAL MODE
  { "<M-k>", ":move '<-2<CR>gv=gv", desc = "move line up", icon = "", mode = "v" },
  { "<M-j>", ":move '>+1<CR>gv=gv", desc = "move line down", icon = "", mode = "v" },
  -- }}}

  -- {{{1 VISUAL/SELECT MODE
  {
    "p",
    'p:let @+=@0<CR>:let @"=@0<CR>',
    desc = "Dont copy replaced text",
    icon = "",
    mode = "x",
    silent = true,
  },
  -- }}}
}

EditorKeymaps:set_icon_color "blue"
EditorKeymaps:register()
