return {
  ---IDE-like breadcrumbs, out of the box
  "Bekaboo/dropbar.nvim",
  enabled = false, ---activate when neovim version >= 0.10.0
  event = "VeryLazy",
  -- optional, but required for fuzzy finder support
  dependencies = {
    "nvim-telescope/telescope-fzf-native.nvim",
  },
}
