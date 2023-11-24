---@module "srv.utils.fn"
local fn = require "srv.utils.fn"

local set = vim.opt
local let = vim.g

set.clipboard = "unnamedplus"

set.confirm = true

set.cursorline = true
set.laststatus = 3

set.foldmethod = "marker"
set.fillchars = {
  foldopen = "󰅀",
  foldclose = "󰅂",
  fold = " ",
  foldsep = " ",
  diff = "╱",
  eob = "~",
}

set.ignorecase = true
set.smartcase = true
set.hlsearch = true

set.mouse = "a"

set.showmode = false

set.pumblend = 10

set.number = true
set.relativenumber = true
set.numberwidth = 2

set.ruler = false

set.tabstop = 2
set.shiftwidth = 2
set.expandtab = true
set.signcolumn = "yes"

set.splitbelow = true
set.splitright = true

set.termguicolors = true

set.timeoutlen = 400

set.undofile = true
set.undolevels = 10000

set.virtualedit = "block"

set.updatetime = 250

set.smoothscroll = true

---go to previous/next line with h,l,left arrow and right arrow
---when cursor reaches end/beginning of line
set.whichwrap:append "<>[]hl"

set.colorcolumn = "81"

let.mapleader = " "

---add binaries installed by mason.nvim to path
local is_windows = vim.loop.os_uname().sysname == "Windows_NT"
vim.env.PATH = vim.fn.stdpath "data"
  .. "/mason/bin"
  .. (is_windows and ";" or ":")
  .. vim.env.PATH

---@type string
---The path where luasnip will look for snippets
let.lua_snippets_path = vim.fs.normalize(vim.fn.stdpath "config" .. "/lua/srv/snippets")

local providers = {
  node = {
    lnx = "/home/linuxbrew/.linuxbrew/bin/neovim-node-host",
    win = os.getenv "APPDATA" .. "/npm/node_modules/neovim/bin/cli.js",
  },

  ruby = {
    lnx = "/home/linuxbrew/.linuxbrew/bin/ruby",
    win = "C:/tools/ruby31/bin/ruby.exe",
  },

  perl = {
    lnx = "/usr/bin/perl",
    win = "C:/Strawberry/perl/bin/perl.exe",
  },

  python3 = {
    lnx = "/home/sravioli/.py-nvim/bin/python3",
    win = os.getenv "USERPROFILE" .. "/.py-nvim/Scripts/python.exe",
  },
}

---@param prov  string|table<string> Current provider
---@param paths table                The paths to the provider
for prov, paths in pairs(providers) do
  let["loaded_" .. prov .. "_provider"] = nil
  let[prov .. "_host_prog"] = vim.fn.resolve(paths[fn.get_os()])
end

---Load the diagnostic signs
local signs = require("srv.preferences").icons.diagnostics
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
