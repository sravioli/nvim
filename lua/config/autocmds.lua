-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

local au = vim.api.nvim_create_autocmd
local events = require "utils.events"

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
