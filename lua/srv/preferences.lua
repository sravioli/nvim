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
  Array = "󰅪 ",
  Boolean = " ",
  BreakStatement = "󰙧 ",
  Call = "󰃷 ",
  CaseStatement = "󱃙 ",
  Class = " ",
  Color = "󰏘 ",
  Constant = "󰏿 ",
  Constructor = " ",
  ContinueStatement = "→ ",
  Copilot = " ",
  Declaration = "󰙠 ",
  Delete = "󰩺 ",
  DoStatement = "󰑖 ",
  Enum = " ",
  EnumMember = " ",
  Event = " ",
  Field = " ",
  File = "󰈔 ",
  Folder = "󰉋 ",
  ForStatement = "󰑖 ",
  Function = "󰊕 ",
  H1Marker = "󰉫 ",
  H2Marker = "󰉬 ",
  H3Marker = "󰉭 ",
  H4Marker = "󰉮 ",
  H5Marker = "󰉯 ",
  H6Marker = "󰉰 ",
  Identifier = "󰀫 ",
  IfStatement = "󰇉 ",
  Interface = " ",
  Keyword = "󰌋 ",
  List = "󰅪 ",
  Log = "󰦪 ",
  Lsp = " ",
  Macro = "󰁌 ",
  MarkdownH1 = "󰉫 ",
  MarkdownH2 = "󰉬 ",
  MarkdownH3 = "󰉭 ",
  MarkdownH4 = "󰉮 ",
  MarkdownH5 = "󰉯 ",
  MarkdownH6 = "󰉰 ",
  Method = "󰆧 ",
  Module = "󰏗 ",
  Namespace = "󰅩 ",
  Null = "󰢤 ",
  Number = "󰎠 ",
  Object = "󰅩 ",
  Operator = "󰆕 ",
  Package = "󰆦 ",
  Pair = "󰅪 ",
  Property = " ",
  Reference = "󰦾 ",
  Regex = " ",
  Repeat = "󰑖 ",
  Scope = "󰅩 ",
  Snippet = "󰩫 ",
  Specifier = "󰦪 ",
  Statement = "󰅩 ",
  String = "󰉾 ",
  Struct = " ",
  SwitchStatement = "󰺟 ",
  Terminal = " ",
  Text = " ",
  Type = " ",
  TypeParameter = "󰆩 ",
  Unit = " ",
  Value = "󰎠 ",
  Variable = "󰀫 ",
  WhileStatement = "󰑖 ",
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

