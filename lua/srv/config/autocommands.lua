---User defined autocommands
---@module "autocommands"
---@author sRavioli
---@license GPL-3.0

local au = vim.api.nvim_create_autocmd

local aug = require "srv.config.augroups"

au("UiEnter", {
  desc = "Load notify after startup",
  group = aug.OnUiEnter,
  pattern = "*",
  callback = function()
    local notify_installed, notify = pcall(require, "notify")
    if notify_installed then vim.notify = notify end
  end,
})

---Restore the >_ cursor when exiting nvim
au("VimLeave", {
  desc = "Restore WindowsTerminal cursor shape upon exit (WindowsTerminal)",
  group = aug.CursorGroup,
  pattern = "*",
  callback = function() vim.opt.guicursor:append "a:hor20-blinkon1" end,
})

---Highlight text on yank
au("TextYankPost", {
  desc = "Highlight selection on yank",
  pattern = "*",
  group = aug.CursorGroup,
  callback = function() vim.highlight.on_yank { higroup = "Search", timeout = 200 } end,
})

au("FileType", {
  desc = "remap some keys for the help page",
  pattern = "help",
  group = aug.VimHelp,
  callback = function()
    local opts = function(desc) return { buffer = true, silent = true, desc = desc } end
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
au({ "InsertLeave", "WinEnter" }, {
  desc = "Show cursor in current buffer",
  pattern = "*",
  command = "set cursorline",
  group = aug.CursorGroup,
})
au({ "InsertEnter", "WinLeave" }, {
  desc = "Hide cursor in non active buffer",
  pattern = "*",
  command = "set nocursorline",
  group = aug.CursorGroup,
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
      vim.cmd(string.format("highlight link %s %s", pattern, highlight)) ---Define highlighting attributes
    end
  end,
  group = aug.custom_highlights,
})

---Set filetype to "pseudo"
au({ "BufNewFile", "BufRead" }, {
  desc = "Set custom filetype for `.pseudo` files",
  pattern = "*.pseudo",
  command = "set filetype=pseudo | set syntax=pseudo",
  group = aug.BufDetect,
})

au("FileType", {
  desc = "Change tabstop and shitfwidth",
  pattern = "markdown",
  callback = function()
    vim.opt.tabstop = 2
    vim.opt.shiftwidth = 2
  end,
  group = aug.BufDetect,
})

---Refresh lualine on lsp update
au("User", {
  pattern = "LspProgressStatusUpdated",
  desc = "Refresh lualine on LSP updates",
  group = aug.lualine,
  callback = require("lualine").refresh,
})

au("FileType", {
  pattern = "lua",
  desc = "Change the colorcolumn for lua files",
  group = aug.BufDetect,
  callback = function() vim.opt_local.colorcolumn = "90" end,
})

au("BufWritePre", {
  pattern = "*",
  desc = "update last modified flag",
  group = aug.lua_functions,
  callback = function() require("srv.utils.fn").update_timestamp() end,
})
