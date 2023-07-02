local fn = require "utils.fn"

---@type table Mimic the vimscript `set <option>=<value>`
local set = vim.opt
---@type table Mimic the vimscript `let <option>=<value>`
local let = vim.g

let.transparency = true

set.clipboard = "unnamedplus"
set.cursorline = true

-- set.fillchars = { eob = "~" }
set.ignorecase = true
set.smartcase = true
set.mouse = "a"
set.hlsearch = true
set.showmode = false
set.pumblend = 10

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

let.mapleader = " "

let.editorconfig = true

-- add binaries installed by mason.nvim to path
local is_windows = vim.loop.os_uname().sysname == "Windows_NT"
vim.env.PATH = vim.fn.stdpath "data"
  .. "/mason/bin"
  .. (is_windows and ";" or ":")
  .. vim.env.PATH

let.lua_snippets_path = vim.fn.stdpath "config" .. "/lua/snippets"

---Neovim providers
---@class Providers
---@field node    table Path to the nodejs provider executable
---@field ruby    table Path to the ruby provider executable
---@field perl    table Path to the perl provider executable
---@field python3 table Path to the python3 provider executable
local providers = {
  ---@enum node-paths
  node = {
    lnx = "/home/linuxbrew/.linuxbrew/bin/neovim-node-host",
    win = "C:/Users/fsimo/AppData/Roaming/npm/node_modules/neovim/bin/cli.js",
  },

  ---@enum ruby-paths
  ruby = {
    lnx = "/home/linuxbrew/.linuxbrew/bin/ruby",
    win = "C:/tools/ruby31/bin/ruby.exe",
  },

  ---@enum perl-paths,
  perl = {
    lnx = "/usr/bin/perl",
    win = "C:/Strawberry/perl/bin/perl.exe",
  },

  ---@enum python3-paths,
  python3 = {
    lnx = "/home/sravioli/.py-nvim/bin/python3",
    win = "C:/Users/fsimo/.py-nvim/Scripts/python.exe",
  },
}

---@param prov  string|table Current provider
---@param paths table        The paths to the provider
for prov, paths in pairs(providers) do
  let["loaded_" .. prov .. "_provider"] = nil
  let[prov .. "_host_prog"] = paths[fn.get_os()]
end

-- Define diagnostic signs
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
