return {
  ---An extensible framework for interacting with tests within NeoVim.
  "nvim-neotest/neotest",
  cond = not vim.g.vscode,
  keys = require("srv.keymaps.neotest"):lazy_handler(),
  dependencies = {
    { ---required
      { "nvim-neotest/nvim-nio" },
      { "nvim-lua/plenary.nvim" },
      { "antoinemadec/FixCursorHold.nvim" },
      { "nvim-treesitter/nvim-treesitter" },
    },
    { ---adapters
      { "Issafalcon/neotest-dotnet" },
      { "rouge8/neotest-rust" },
    },
  },
  opts = function(_, _)
    local _, dotnet = pcall(require, "neotest-dotnet")
    local _, rust = pcall(require, "neotest-rust")
    return {
      adapters = {
        dotnet {
          dotnet_additional_args = { "--verbosity normal" },
        },
        rust { args = { "--no-fail-fast" } },
      },
    }
  end,
}
