---User defined autocommands
---@module "autocommands"
---@author sRavioli
---@license GPL-3.0

---@type function Shorthand for `vim.api.nvim_create_autocmd`.
---Add {cmd} to the list of commands that Vim will execute automatically on
---{event} for a file matching {aupat} |autocmd-pattern|.  Note: A quote
---character is seen as argument to the :autocmd and won't start a comment. Nvim
---always adds {cmd} after existing autocommands so they execute in the order in
---which they were defined.  See |autocmd-nested| for [++nested].
local au = vim.api.nvim_create_autocmd

---@type table User defined augroups
local aug = require "custom.utils.augroups"

-- Restore the >_ cursor when exiting nvim
au("VimLeave", {
  desc = "Restore WindowsTerminal cursor shape upon exit",
  pattern = "*",
  command = "set guicursor=a:hor20-blinkon1",
  group = aug.cursor,
})

-- Highlight text on yank
au("TextYankPost", {
  desc = "Highlight selection on yank",
  group = aug.yank_highlight,
  pattern = "*",
  callback = function()
    vim.highlight.on_yank { higroup = "Search", timeout = 200 }
  end,
})

-- Quit from some windows by only pressing q
au("FileType", {
  desc = "Exit some views with 'q'",
  pattern = {
    "help",
    "startuptime",
    "qf",
    "fugitive",
    "null-ls-info",
    "dap-float",
  },
  command = [[nnoremap <buffer><silent> q :quit<CR>]],
  group = aug.exit_views,
})
au("FileType", {
  pattern = "man",
  command = [[nnoremap <buffer><silent> q :quit<CR>]],
  group = aug.exit_views,
})

-- When having multiple buffers, show cursor only in the active one
au({ "InsertLeave", "WinEnter" }, {
  desc = "Show cursor in current buffer",
  pattern = "*",
  command = "set cursorline",
  group = aug.cursor,
})
au({ "InsertEnter", "WinLeave" }, {
  desc = "Hide cursor in non active buffer",
  pattern = "*",
  command = "set nocursorline",
  group = aug.cursor,
})

-- (Barbecue) Gain better performance when moving the cursor around
au({
  "WinScrolled", -- or WinResized on NVIM-v0.9 and higher
  "BufWinEnter",
  "CursorHold",
  "InsertLeave",

  -- include these if you have set `show_modified` to `true`
  "BufWritePost",
  "TextChanged",
  "TextChangedI",
}, {
  desc = "Update Barbecue winbar",
  group = aug.barbecue,
  callback = function()
    require("barbecue.ui").update()
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
      vim.cmd(string.format("highlight link %s %s", pattern, highlight)) -- Define highlighting attributes
    end
  end,
  group = aug.custom_highlights,
})

-- Set filetype to "pseudo"
au({ "BufNewFile", "BufRead" }, {
  desc = "Set custom filetype for `.pseudo` files",
  pattern = "*.pseudo",
  command = "set filetype=pseudo | set syntax=pseudo",
  group = aug.buf_detect,
})

-- Change some highlight groups for markdown
au("FileType", {
  desc = "Change highlight groups",
  pattern = "markdown",
  command = [[highlight! link @text.emphasis Italic]],
  group = aug.custom_highlights,
})

-- Enable markdown auto-align table
au("FileType", {
  desc = "Align markdown tables as you type",
  pattern = "markdown",
  callback = function()
    vim.keymap.set(
      "i",
      "<Bar>",
      "<Bar> <C-o>:lua require('utils.fn').align_table()<CR>"
    )
  end,
  group = aug.lua_functions,
})
