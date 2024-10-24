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
vim.api.nvim_create_autocmd("BufWritePre", {
  group = vim.api.nvim_create_augroup("better_backup", { clear = true }),
  callback = function(event)
    local file = vim.uv.fs_realpath(event.match) or event.match
    local backup = vim.fn.fnamemodify(file, ":p:~:h")
    backup = backup:gsub("[/\\]", "%%")
    vim.go.backupext = backup
  end,
})

---@type table Doxygen highlight groups and what group to link to.
---Redefine and improve doxygen highlights groups
local doxygen_patterns = {
  { pattern = "doxygenComment", highlight = "Comment" },
  { pattern = "doxygenCommentWhite", highlight = "Comment" },
  { pattern = "doxygenParam", highlight = "Conditional" },
  { pattern = "doxygenSpecial", highlight = "Conditional" },
  { pattern = "doxygenBriefLine", highlight = "Function" },
  { pattern = "doxygenSpecialMultilineDesc", highlight = "Comment" },
  { pattern = "doxygenCodeWord", highlight = "Float" },
  { pattern = "doxygenBody", highlight = "String" },
}
au("FileType", {
  desc = "Apply new doxygen syntax",
  pattern = { "c", "cpp", "doxygen" },
  callback = function()
    for _, doxygen in ipairs(doxygen_patterns) do
      local pattern, highlight = doxygen.pattern, doxygen.highlight
      ---Define highlighting attributes
      vim.cmd(string.format("highlight link %s %s", pattern, highlight))
    end
  end,
  -- group = aug.custom_highlights,
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
    require("srv.utils.fun").fmt.update_timestamp()
  end,
})

au({ "BufNewFile", "BufRead" }, {
  pattern = "*.xaml",
  callback = function()
    vim.opt_local.filetype = "xml"
  end,
})

au("Filetype", {
  pattern = "norg",
  callback = function()
    local map = vim.keymap.set
    map("i", "<C-CR>", "<Plug>(core.itero.next-iteration)", { buffer = true })
    map("n", "<up>", "<Plug>(neorg.text-objects.item-up)", { buffer = true })
    map("n", "<down>", "<Plug>(neorg.text-objects.item-down)", { buffer = true })
    map(
      { "o", "x" },
      "iH",
      "<Plug>(neorg.text-objects.textobject.heading.inner)",
      { buffer = true }
    )
    map(
      { "o", "x" },
      "aH",
      "<Plug>(neorg.text-objects.textobject.heading.outer)",
      { buffer = true }
    )
    map(
      "n",
      "<localleader>cm",
      "<Plug>(neorg.looking-glass.magnify-code-block)",
      { buffer = true }
    )
    map("n", "<localleader>id", "<Plug>(neorg.tempus.insert-date)", { buffer = true })
    map("n", "<localleader>li", "<Plug>(neorg.pivot.list.invert)", { buffer = true })
    map("n", "<localleader>lt", "<Plug>(neorg.pivot.list.toggle)", { buffer = true })
    map(
      "n",
      "<localleader>ta",
      "<Plug>(neorg.qol.todo-items.todo.task-ambiguous)",
      { buffer = true }
    )
    map(
      "n",
      "<localleader>tc",
      "<Plug>(neorg.qol.todo-items.todo.task-cancelled)",
      { buffer = true }
    )
    map(
      "n",
      "<localleader>td",
      "<Plug>(neorg.qol.todo-items.todo.task-done)",
      { buffer = true }
    )
    map(
      "n",
      "<localleader>th",
      "<Plug>(neorg.qol.todo-items.todo.task-on-hold)",
      { buffer = true }
    )
    map(
      "n",
      "<localleader>ti",
      "<Plug>(neorg.qol.todo-items.todo.task-important)",
      { buffer = true }
    )
    map(
      "n",
      "<localleader>tp",
      "<Plug>(neorg.qol.todo-items.todo.task-pending)",
      { buffer = true }
    )
    map(
      "n",
      "<localleader>tr",
      "<Plug>(neorg.qol.todo-items.todo.task-recurring)",
      { buffer = true }
    )
    map(
      "n",
      "<localleader>tu",
      "<Plug>(neorg.qol.todo-items.todo.task-undone)",
      { buffer = true }
    )
  end,
})
