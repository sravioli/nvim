return {
  ---A tree like view for symbols in Neovim using the Language Server Protocol.
  ---Supports all your favourite languages.
  -- "simrat39/symbols-outline.nvim",
  "enddeadroyal/symbols-outline.nvim",
  branch = "bugfix/symbol-hover-misplacement",
  keys = {
    { "<F8>", "<cmd>SymbolsOutline<CR>", desc = "󰔡   Toggle symbols outline" },
  },
  opts = function()
    local kinds = require("srv.preferences").icons.kinds
    return {
      highlight_hovered_item = true,
      show_guides = true,
      auto_preview = false,
      border = require("srv.preferences").border,
      relative_width = true,
      width = 30,
      preview_bg_highlight = "NormalFloat",
      wrap = false,
      symbols = {
        File = { icon = kinds.File, hl = "@text.uri" },
        Module = { icon = kinds.Module, hl = "@namespace" },
        Namespace = { icon = kinds.Namespace, hl = "@namespace" },
        Package = { icon = kinds.Package, hl = "@namespace" },
        Class = { icon = kinds.Class, hl = "@type" },
        Method = { icon = kinds.Method, hl = "@method" },
        Property = { icon = kinds.Property, hl = "@method" },
        Field = { icon = kinds.Field, hl = "@field" },
        Constructor = { icon = kinds.Constructor, hl = "@constructor" },
        Enum = { icon = kinds.Enum, hl = "@type" },
        Interface = { icon = kinds.Interface, hl = "@type" },
        Function = { icon = kinds.Interface, hl = "@function" },
        Variable = { icon = kinds.Variable, hl = "@constant" },
        Constant = { icon = kinds.Constant, hl = "@constant" },
        String = { icon = kinds.String, hl = "@string" },
        Number = { icon = kinds.Number, hl = "@number" },
        Boolean = { icon = kinds.Boolean, hl = "@boolean" },
        Array = { icon = kinds.Array, hl = "@constant" },
        Object = { icon = kinds.Object, hl = "@type" },
        Key = { icon = kinds.Keyword, hl = "@type" },
        Null = { icon = kinds.Null, hl = "@type" },
        EnumMember = { icon = kinds.EnumMember, hl = "@field" },
        Struct = { icon = kinds.Struct, hl = "@type" },
        Event = { icon = kinds.Event, hl = "@type" },
        Operator = { icon = kinds.Operator, hl = "@operator" },
        TypeParameter = { icon = kinds.TypeParameter, hl = "@parameter" },
        Component = { icon = kinds.Component, hl = "@function" },
        Fragment = { icon = kinds.Fragment, hl = "@constant" },
      },
    }
  end,
}
