---@type table Mimic the vimscript `set <option>=<value>`
local set = vim.opt
---@type table Mimic the vimscript `let <option>=<value>`
local let = vim.g

let.transparency = true

set.clipboard = ""
set.cursorline = true

-- set.fillchars = { eob = "~" }
set.ignorecase = true
set.smartcase = true
set.mouse = "a"
set.hlsearch = true

-- Numbers
set.number = true
set.relativenumber = true
set.numberwidth = 2
set.ruler = false

-- Tab
set.tabstop = 2
set.shiftwidth = 2
set.expandtab = true

-- disable nvim intro
-- set.shortmess:append "sI"

set.signcolumn = "yes"
set.splitbelow = true
set.splitright = true
set.termguicolors = true
set.timeoutlen = 400
set.undofile = true

set.colorcolumn = "80"

-- interval for writing swap file to disk, also used by gitsigns
set.updatetime = 250

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
set.whichwrap:append "<>[]hl"

let.mapleader = "<Space>"

let.editorconfig = true

-- add binaries installed by mason.nvim to path
local is_windows = vim.loop.os_uname().sysname == "Windows_NT"
vim.env.PATH = vim.fn.stdpath "data"
  .. "/mason/bin"
  .. (is_windows and ";" or ":")
  .. vim.env.PATH
