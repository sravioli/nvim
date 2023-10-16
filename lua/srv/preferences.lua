---Global user preferences
---@class Preferences
---@field border string The preferred border for UI windows and similar
---@field icons Icons
local Preferences = {}

Preferences.border = "rounded"

---Various icons for kinds, diagnostics, etc.
---@class Icons table<table>
Preferences.icons = {}

---@enum kinds Icons for the various kinds
Preferences.icons.kinds = {
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
Preferences.icons.diagnostics = {
  Error = " ",
  Warn = " ",
  Hint = " ",
  Info = " ",
  Debug = " ",
  Trace = " ",
}

---@enum dap Icons for dap diagnostics
Preferences.icons.dap = {
  Stopped = { "󰁕 ", "DiagnosticWarn", "DapStoppedLine" },
  Breakpoint = " ",
  BreakpointCondition = " ",
  BreakpointRejected = { " ", "DiagnosticError" },
  LogPoint = ".>",
}

---@enum git Icons for git signs
Preferences.icons.git = {
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

return Preferences
