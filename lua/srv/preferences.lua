---Global user preferences
---@class Preferences
---@field border string The preferred border for UI windows and similar
---@field border_chars function<table> The characters to use as a border
---@field kind_icons table<string> The icons to use for the various kinds
---@field signs table<string> The icons to use for diagnostics messages
local preferences = {
  border = "rounded",

  ---@param hl_name string The highlight to set for the border character
  border_chars = function(hl_name)
    return {
      { "╭", hl_name },
      { "─", hl_name },
      { "╮", hl_name },
      { "│", hl_name },
      { "╯", hl_name },
      { "─", hl_name },
      { "╰", hl_name },
      { "│", hl_name },
    }
  end,

  kind_icons = {
    Text = "",
    Method = "󰆧",
    Function = "󰊕",
    Package = "",
    String = "󰅳 ",
    Number = " ",
    Boolean = " ",
    Array = " ",
    Null = "󰟢 ",
    Object = "󰐾 ",
    Component = "󰡱",
    Fragment = "",
    Constructor = "",
    Field = "󰇽",
    Variable = "󰂡",
    Class = "󰠱",
    Interface = "",
    Module = "",
    Property = "󰜢",
    Unit = "",
    Value = "󰎠",
    Enum = "",
    Keyword = "󰌋",
    Snippet = " ",
    Color = "󰏘",
    File = "󰈙",
    Reference = "",
    Folder = "󰉋",
    EnumMember = "",
    Constant = "󰏿",
    Struct = "",
    Event = "",
    Operator = "󰆕",
    TypeParameter = "󰅲",
  },

  signs = {
    Error = " ",
    Warn = " ",
    Hint = " ",
    Info = " ",
  },
}

return preferences
