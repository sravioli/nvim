local opts = { buffer = 0 }
return {
  plugin = true,

  n = {
    ["<M-i>"] = { ":ToggleTerm direction=float<CR>", "Toggle floating terminal" },
    ["<M-h>"] = {
      ":ToggleTerm direction=horizontal<CR>",
      "Toggle horizontal terminal",
    },
    ["<M-v>"] = { ":ToggleTerm direction=vertical<CR>", "Toggle vertical terminal" },
  },

  t = {
    ["<M-i>"] = { "<cmd>ToggleTerm direction=float<CR>", "Toggle floating terminal" },
    ["<M-h>"] = {
      "<cmd>ToggleTerm direction=horizontal<CR>",
      "Toggle horizontal terminal",
    },
    ["<M-v>"] = {
      "<cmd>ToggleTerm direction=vertical<CR>",
      "Toggle vertical terminal",
    },

    ["<Esc>"] = { "<C-\\><C-n>", "Escape terminal mode", opts = opts },
    ["jk"] = { "<C-\\><C-n>", "Escape terminal mode", opts = opts },
  },
}
