local set = vim.opt
local let = vim.g

local fun = require "srv.utils.fun" ---@class Fun
local is_windows = fun.os_info()[1] == "windows_nt"

local uv = vim.loop
if fun.has "nvim-0.10.0" then
  uv = vim.uv
  set.smoothscroll = true
end

if is_windows then
  vim.cmd.language "messages en"
end

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

if is_windows then
  set.shell = vim.fn.executable "pwsh" == 1 and "pwsh" or "powershell"
  set.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command "
    .. "[Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
  set.shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait"
  set.shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
  set.shellxquote = ""
  set.shellquote = ""
end

---go to previous/next line with h,l,left arrow and right arrow
---when cursor reaches end/beginning of line
set.whichwrap:append "<>[]hl"

set.colorcolumn = "81"

let.mapleader = " "
let.maplocalleader = ","

---add binaries installed by mason.nvim to path
vim.env.PATH = vim.fn.stdpath "data"
  .. "/mason/bin"
  .. (is_windows and ";" or ":")
  .. vim.env.PATH

---@type string
---The path where luasnip will look for snippets
let.lua_snippets_path = vim.fs.normalize(vim.fn.stdpath "config" .. "/lua/srv/snippets")

fun.providers.enable()

---Load the diagnostic signs
local signs = require("srv.preferences").icons.diagnostics
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
