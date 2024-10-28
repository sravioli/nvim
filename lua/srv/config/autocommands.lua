---User defined autocommands
---@module "autocommands"
---@author sRavioli
---@license GPL-3.0

local au = vim.api.nvim_create_autocmd
local events = require "srv.utils.events"

local _aug = function(name, opts)
  return vim.api.nvim_create_augroup(name .. "Group", opts or {})
end

---@class Autogroups
---@field Cursor             number for cursor related autocommands.
---@field CheckOutsideChange number when checking for outside changes to file.
---@field OnLazyFile         number when entering a file.
---@field OnVimHelpEnter     number when entering vim help files.
local aug = {
  Cursor = _aug "Cursor",
  CheckOutsideChange = _aug "CheckOutsideChange",
  FocusChanged = _aug "FocusChanged",
  OnLazyFile = _aug "OnLazyFile",
  OnVimHelpEnter = _aug "OnVimHelpEnter",
  OneKeyExit = _aug "OneKeyExit",
  BetterBackup = _aug("better_backup", { clear = true }),
}

au(events.FocusGained, {
  group = aug.FocusChanged,
  command = "checktime",
})

---Restore the >_ cursor when exiting nvim
au("VimLeave", {
  desc = "Restore WindowsTerminal cursor shape upon exit (WindowsTerminal)",
  group = aug.Cursor,
  pattern = "*",
  callback = function()
    vim.opt.guicursor:append "a:hor20-blinkon1"
  end,
})

---Highlight text on yank
au("TextYankPost", {
  desc = "Highlight selection on yank",
  pattern = "*",
  group = aug.Cursor,
  callback = function()
    vim.highlight.on_yank { higroup = "Search", timeout = 200 }
  end,
})

au("FileType", {
  desc = "remap some keys for the help page",
  pattern = "help",
  group = aug.OnVimHelpEnter,
  callback = function()
    local opts = function(desc)
      return { buffer = true, silent = true, desc = desc }
    end
    vim.keymap.set("n", "<CR>", "<C-]>", opts "Jump to tag")
    vim.keymap.set("n", "<BS>", "<C-o>", opts "Return to prev tag")
    vim.keymap.set("n", "q", ":quit<CR>", opts "exit help buffer")
    vim.opt_local.conceallevel = 3
    vim.opt_local.concealcursor = "nvc"
  end,
})

---Quit from some windows by only pressing q
au("FileType", {
  desc = "Exit some views with 'q'",
  pattern = {
    "startuptime",
    "qf",
    "fugitive",
    "null-ls-info",
    "dap-float",
    "sagarename",
    "nvimtree",
  },
  command = [[nnoremap <buffer><silent> q :quit<CR>]],
  group = aug.OneKeyExit,
})

au("FileType", {
  pattern = "man",
  command = [[nnoremap <buffer><silent> q :quit<CR>]],
  group = aug.OneKeyExit,
})

---When having multiple buffers, show cursor only in the active one
-- show cursor line only in active window
au({ "InsertLeave", "WinEnter" }, {
  callback = function()
    if vim.w.auto_cursorline then
      vim.wo.cursorline = true
      vim.w.auto_cursorline = nil
    end
  end,
})
au({ "InsertEnter", "WinLeave" }, {
  callback = function()
    if vim.wo.cursorline then
      vim.w.auto_cursorline = true
      vim.wo.cursorline = false
    end
  end,
})

-- backups
au("BufWritePre", {
  group = aug.BetterBackup,
  callback = function(event)
    local file = vim.uv.fs_realpath(event.match) or event.match
    local backup = vim.fn.fnamemodify(file, ":p:~:h")
    backup = backup:gsub("[/\\]", "%%")
    vim.go.backupext = backup
  end,
})

---Set filetype to "pseudo"
au({ "BufNewFile", "BufRead" }, {
  desc = "Set custom filetype for `.pseudo` files",
  pattern = "*.pseudo",
  command = "set filetype=pseudo | set syntax=pseudo",
  group = aug.OnLazyFile,
})

au({ "BufNewFile", "BufRead" }, {
  desc = "Enble rasi highlight",
  pattern = "*.rasi",
  command = "set filetype=rasi | set syntax=rasi",
  group = aug.OnLazyFile,
})

au("FileType", {
  desc = "Change tabstop and shitfwidth",
  pattern = "markdown",
  callback = function()
    vim.opt.tabstop = 2
    vim.opt.shiftwidth = 2
  end,
  group = aug.OnLazyFile,
})

au("FileType", {
  pattern = "lua",
  desc = "Change the colorcolumn for lua files",
  group = aug.OnLazyFile,
  callback = function()
    vim.opt_local.colorcolumn = "90"
  end,
})

au("BufWritePost", {
  pattern = "*",
  desc = "update last modified flag",
  callback = function()
    vim.cmd [[%s/\s\+$//e]]
    require("srv.utils.fun").fmt.update_timestamp()
  end,
})

au({ "BufNewFile", "BufRead" }, {
  pattern = "*.xaml",
  callback = function()
    vim.opt_local.filetype = "xml"
  end,
})

au(events.LazyFile, {
  group = aug.OnLazyFile,
  pattern = "*.norg",
  callback = function()
    vim.opt_local.syntax = "norg"
    vim.opt_local.filetype = "norg"
    vim.opt_local.conceallevel = 3
    vim.opt_local.concealcursor = "vc"

    vim.api.nvim_set_hl(0, "@neorg.markup.verbatim", { fg = "#98bb6c", bg = "#2a2a37" })
    vim.keymap.set({ "n", "i" }, "<M-s>", "<cmd>noautocmd write<CR>")
  end,
})

au("BufWritePre", {
  group = vim.api.nvim_create_augroup("Neorg", {}),
  pattern = "*.norg",
  callback = vim.schedule_wrap(function()
    vim.cmd [[%s#\r#\r#ge]] -- convert line endings
    vim.cmd [[%s#Get your own SQL Server$##gIe]] -- rm useless junk
    vim.cmd [[%s#\v(^*{1,6}.*$)#\r\1\r#gIe]] -- add whitespace around headings
    vim.cmd [[%s#\v(^\s+\@code.*$(\_.){-}\@end$)#\r\1\r#gIe]] -- whitespace around code blocks
    vim.cmd [[g#^\_$\n\_^$#d]] -- multiple blank lines to single one
    vim.cmd.Neorg "update-metadata"
    vim.cmd [[execute('normal gg=G``zzzv')]] -- format whole document, return to last pos
  end),
})
