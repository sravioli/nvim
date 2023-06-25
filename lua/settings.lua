---@type table Mimic the vimscript `set <option>=<value>`
local set = vim.opt
---@type table Mimic the vimscript `let <option>=<value>`
local let = vim.g

---Highlight the text line of the cursor with CursorLine. Useful to easily spot
---the cursor.  Will make screen redrawing slower.
set.cursorline = false

---Print the line number in front of each line.
set.number = true

---Show the line number relative to the line with the cursor in front of each
---line. Relative line numbers help you use the |count| you can precede some
---vertical motion commands (e.g. j k + -) with, without having to calculate it
---yourself.
set.relativenumber = true

---Override the 'ignorecase' option if the search pattern contains upper case
---characters.  Only used when the search pattern is typed and 'ignorecase'
---option is on.  Used for the commands "/", "?", "n", "N",
set.smartcase = true

---When there is a previous search pattern, highlight all its matches. The
---highlight group determines the highlighting for all matches not under the
---cursor while the highlight group (if defined) determines the highlighting for
---the match under the cursor.
set.hlsearch = false

---'colorcolumn' is a comma-separated list of screen columns that are highlighted
---with ColorColumn.  Useful to align text.  Will make screen redrawing slower.
set.colorcolumn = "80"

---If this many milliseconds nothing is typed the swap file will be written to
---disk (see crash-recovery).  Also used for the CursorHold autocommand event.
set.updatetime = 200

---Number of spaces that a <Tab> in the file counts for.  Also see the :retab
---command, and the 'softtabstop' option.
set.tabstop = 2

---Number of spaces to use for each step of (auto)indent.  Used for |'cindent'|,
---|>>|, |<<|, etc.
set.shiftwidth = 2

---In Insert mode: Use the appropriate number of spaces to insert a <Tab>.
---Spaces are used in indents with the '>' and '<' commands and when 'autoindent'
---is on.
set.expandtab = true

---Configure plugins settings and editor settings

---Enable editorconfig plugin
let.editorconfig = true

vim.opt.termguicolors = true
vim.g.transparency = true
