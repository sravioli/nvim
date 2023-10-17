return {
  ---🏙 A clean, dark Neovim theme written in Lua, with support for lsp, treesitter
  ---and lots of plugins. Includes additional themes for Kitty, Alacritty, iTerm and
  ---Fish.
  "folke/tokyonight.nvim",
  enabled = false,
  lazy = false,
  priority = 1000,
  init = function() vim.cmd.colorscheme "tokyonight" end,
  opts = {
    style = "night",
    transparent = true,
    styles = {
      -- Style to be applied to different syntax groups
      -- Value is any valid attr-list value for `:help nvim_set_hl`
      comments = { italic = true },
      keywords = { italic = true },
      functions = {},
      variables = {},
      -- Background styles. Can be "dark", "transparent" or "normal"
      sidebars = "transparent", -- style for sidebars, see below
      floats = "transparent", -- style for floating windows
    },
  },
}
