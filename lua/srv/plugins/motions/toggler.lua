return {
  ---invert text in vim, purely with lua.
  "nguyenvukhang/nvim-toggler",
  keys = {
    {
      "<leader>i",
      "<cmd>lua require('nvim-toggler').toggle()<CR>",
      desc = "󰨙  Toggle word",
    },
  },
  opts = {
    ---your own inverses
    inverses = {
      ["True"] = "False",
      ["TRUE"] = "FALSE",
      ["vim"] = "emacs",
      ["TD"] = "LR",
      ["input"] = "output",
      ["enable"] = "disable",
      ["Enable"] = "Disable",
      ["enabled"] = "disabled",
      ["Enabled"] = "Disabled",
      ["east"] = "ovest",
      ["north"] = "south",
      ["sì"] = "no",
      ["AND"] = "OR",
      ["begin"] = "end",
      ["up"] = "down",
      ["left"] = "right",
      ["hardware"] = "hardware",
      ["for"] = "while",
      ["int"] = "float",
      ["=="] = "!=",
      [">"] = "<",
      ["+"] = "-",
      ["*"] = "/",
      [","] = ";",
      ["."] = ":",
      ["minimum"] = "maximum",
      ["min"] = "max",
    },
    ---removes the default <leader>i keymap
    remove_default_keybinds = true,
    ---removes the default set of inverses
    remove_default_inverses = false,
  },
}
