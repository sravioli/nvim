---Global user preferences
---@class Preferences
---@field border string The preferred border for UI windows and similar
---@field icons Icons
local M = {}

M.border = "rounded"

---Various icons for kinds, diagnostics, etc.
---@class Icons
M.icons = {}

---@enum kinds Icons for the various kinds
M.icons.kinds = {
  Array = " ",
  Boolean = " ",
  Class = " ",
  Color = " ",
  Component = "󰡱",
  Constant = "󰏿",
  Constructor = "",
  Copilot = " ",
  Enum = " ",
  EnumMember = " ",
  Event = "",
  Field = "󰇽",
  File = "󰈙",
  Folder = "󰉋",
  Fragment = "",
  Function = "󰊕",
  Interface = "",
  Key = " ",
  Keyword = "󰌋",
  Method = " ",
  Module = " ",
  Null = "󰟢 ",
  Number = " ",
  Object = " ",
  Operator = "󰆕",
  Package = "",
  Property = "󰜢",
  Reference = " ",
  Snippet = " ",
  String = "󰅳 ",
  Struct = " ",
  Text = " ",
  TypeParameter = " ",
  Unit = " ",
  Value = " ",
  Variable = "󰂡",
}

---@enum diagnostics Icons for diagnostic messages
M.icons.diagnostics = {
  Error = " ",
  Warn = " ",
  Hint = " ",
  Info = " ",
  Debug = " ",
  Trace = " ",
}

---@enum dap Icons for dap diagnostics
M.icons.dap = {
  Stopped = { "󰁕 ", "DiagnosticWarn", "DapStoppedLine" },
  Breakpoint = " ",
  BreakpointCondition = " ",
  BreakpointRejected = { " ", "DiagnosticError" },
  LogPoint = ".>",
}

---@enum git Icons for git signs
M.icons.git = {
  Branch = "  ",

  Added = "  ",
  Modified = "  ",
  Removed = "  ",
  Renamed = "",

  Deleted = "󰆴",

  ---Status type
  Untracked = "",
  Ignored = "",
  Unstaged = "󱋭",
  Staged = "",
  Conflict = "",
}

M.spinners = {}

M.spinners.FiraCode = { "", "", "", "", "", "" }

M.spinners.dots = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }

M.progress_bar = {}

M.progress_bar.FiraCode = {
  empty = { "", "", "" },
  full = { "", "", "" },
}

return M
