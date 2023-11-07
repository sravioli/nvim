return {
  ---invert text in vim, purely with lua.
  "nguyenvukhang/nvim-toggler",
  keys = {
    {
      "<leader>i",
      function() require("nvim-toggler").toggle() end,
      desc = "󰨙  Toggle word",
    },
  },
  opts = {
    ---your own inverses
    inverses = {
      ["true"] = "false",
      ["True"] = "False",
      ["TRUE"] = "FALSE",

      ["TD"] = "LR",

      ["input"] = "output",
      ["Input"] = "Output",
      ["INPUT"] = "OUTPUT",

      ["enable"] = "disable",
      ["Enable"] = "Disable",
      ["ENABLE"] = "DISABLE",

      ["enabled"] = "disabled",
      ["Enabled"] = "Disabled",
      ["ENABLED"] = "DISABLED",

      ["top"] = "bottom",
      ["Top"] = "Bottom",
      ["TOP"] = "BOTTOM",

      ["plus"] = "minus",
      ["Plus"] = "Minus",
      ["PLUS"] = "MINUS",

      ["east"] = "ovest",
      ["north"] = "south",

      ["sì"] = "no",
      ["AND"] = "OR",
      ["begin"] = "end",
      ["up"] = "down",
      ["left"] = "right",
      ["hardware"] = "software",
      ["for"] = "while",
      ["int"] = "float",
      ["=="] = "!=",
      [">"] = "<",
      ["+"] = "-",
      ["*"] = "/",
      ["minimum"] = "maximum",
      ["min"] = "max",
      ["- [ ]"] = "- [X]",
      ["[ ]"] = "[X]",
    },
    ---removes the default <leader>i keymap
    remove_default_keybinds = true,
    ---removes the default set of inverses
    remove_default_inverses = true,
  },
}
