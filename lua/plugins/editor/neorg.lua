return {
  ---Modernity meets insane extensibility. The future of organizing your life
  ---in Neovim.
  "nvim-neorg/neorg",
  dependencies = { "nvim-lua/plenary.nvim" },
  build = ":Neorg sync-parsers",
  ft = "norg",
  opts = {
    load = {
      ["core.defaults"] = {}, ---Loads default behaviour
      ["core.concealer"] = { ---Adds pretty icons to your documents
        config = {
          folds = false,
          icon_preset = "varied",
        },
      },
      ["core.dirman"] = { ---Manages Neorg workspaces
        config = {
          workspaces = {
            notes = "~/notes",
            L31 = "~/L31/norg",
          },
        },
      },
      ["core.completion"] = {
        config = {
          engine = "nvim-cmp",
          name = "(Norg)",
        },
      },
      ["core.export"] = {},
      ["core.export.markdown"] = {
        config = {
          extension = "md",
          extensions = "all",
        },
      },
    },
  },
}
