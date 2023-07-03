local preferences = {
  border = "rounded",

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
