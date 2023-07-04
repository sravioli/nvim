local icons = require("srv.preferences").kind_icons
return {
  ---A tree like view for symbols in Neovim using the Language Server Protocol.
  ---Supports all your favourite languages.
  -- "simrat39/symbols-outline.nvim",
  "enddeadroyal/symbols-outline.nvim",
  branch = "bugfix/symbol-hover-misplacement",
  keys = {
    { "<F8>", "<cmd>SymbolsOutline<CR>", desc = "󰔡   Toggle symbols outline" },
  },
  opts = {
    highlight_hovered_item = true,
    show_guides = true,
    auto_preview = false,
    border = require("srv.preferences").border,
    relative_width = true,
    width = 30,
    preview_bg_highlight = "NormalFloat",
    wrap = false,
    symbols = {
      File = { icon = icons.File, hl = "@text.uri" },
      Module = { icon = icons.Module, hl = "@namespace" },
      Namespace = { icon = icons.Namespace, hl = "@namespace" },
      Package = { icon = icons.Package, hl = "@namespace" },
      Class = { icon = icons.Class, hl = "@type" },
      Method = { icon = icons.Method, hl = "@method" },
      Property = { icon = icons.Property, hl = "@method" },
      Field = { icon = icons.Field, hl = "@field" },
      Constructor = { icon = icons.Constructor, hl = "@constructor" },
      Enum = { icon = icons.Enum, hl = "@type" },
      Interface = { icon = icons.Interface, hl = "@type" },
      Function = { icon = icons.Interface, hl = "@function" },
      Variable = { icon = icons.Variable, hl = "@constant" },
      Constant = { icon = icons.Constant, hl = "@constant" },
      String = { icon = icons.String, hl = "@string" },
      Number = { icon = icons.Number, hl = "@number" },
      Boolean = { icon = icons.Boolean, hl = "@boolean" },
      Array = { icon = icons.Array, hl = "@constant" },
      Object = { icon = icons.Object, hl = "@type" },
      Key = { icon = icons.Keyword, hl = "@type" },
      Null = { icon = icons.Null, hl = "@type" },
      EnumMember = { icon = icons.EnumMember, hl = "@field" },
      Struct = { icon = icons.Struct, hl = "@type" },
      Event = { icon = icons.Event, hl = "@type" },
      Operator = { icon = icons.Operator, hl = "@operator" },
      TypeParameter = { icon = icons.TypeParameter, hl = "@parameter" },
      Component = { icon = icons.Component, hl = "@function" },
      Fragment = { icon = icons.Fragment, hl = "@constant" },
    },
  },
}