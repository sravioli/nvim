return {
  ---An extensible framework for interacting with tests within NeoVim.
  "nvim-neotest/neotest",
  cond = not vim.g.vscode,
  dependencies = {
    { ---required
      { "nvim-neotest/nvim-nio" },
      { "nvim-lua/plenary.nvim" },
      { "antoinemadec/FixCursorHold.nvim" },
      { "nvim-treesitter/nvim-treesitter" },
    },
    { ---adapters
      { "Issafalcon/neotest-dotnet" },
    },
  },
  opts = function(_, _)
    local _, dotnet = pcall(require, "neotest-dotnet")
    return {
      adapters = {
        dotnet {
          dotnet_additional_args = { "--verbosity normal" },
        },
      },
    }
  end,
}
