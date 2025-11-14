-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local set = vim.opt
local let = vim.g

local prefs = require "utils.prefs"

_G.dd = function(...)
  Snacks.debug.inspect(...)
end
_G.bt = function()
  Snacks.debug.backtrace()
end
if vim.fn.has "nvim-0.11" == 1 then
  vim._print = function(_, ...)
    dd(...)
  end
else
  vim.print = dd
end

local fun = require "utils.fun" ---@class Fun
local is_windows = fun.os_info()[1] == "windows_nt"

if fun.has "nvim-0.10.0" then
  set.smoothscroll = true
end

if is_windows then
  vim.cmd.language "messages en"

  set.shell = vim.fn.executable "pwsh" == 1 and "pwsh" or "powershell"
  set.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command "
    .. "[Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
  set.shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait"
  set.shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
  set.shellxquote = ""
  set.shellquote = ""
end

set.pumblend = 10
set.winborder = prefs.border

set.laststatus = 3
set.cmdheight = 1

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

let.lua_snippets_path = vim.fs.normalize(vim.fn.stdpath "config" .. "/snippets")

local signs = prefs.icons.diagnostics
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
