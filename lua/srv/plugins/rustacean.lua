return {
  -- rustaceanvim: 🦀 Supercharge your Rust experience in Neovim! A heavily modified fork
  -- of rust-tools.nvim
  "mrcjkb/rustaceanvim",
  version = "^5", -- Recommended
  lazy = false, -- This plugin is already lazy
  init = function()
    vim.g.rustaceanvim = {
      tools = {
        float_win_config = {
          border = "rounded",
        },
      },
    }
  end,
}
