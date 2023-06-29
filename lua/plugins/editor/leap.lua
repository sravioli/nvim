return {
  -- Neovim's answer to the mouse 🦘
  "ggandor/leap.nvim",
  dependencies = { "tpope/vim-repeat" },
  init = function()
    require("leap").add_default_mappings()
  end,
  event = "BufWinEnter",
}
