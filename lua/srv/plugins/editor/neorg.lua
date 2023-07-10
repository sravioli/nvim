return {
  ---Modernity meets insane extensibility. The future of organizing your life
  ---in Neovim.
  "nvim-neorg/neorg",
  dependencies = { "nvim-lua/plenary.nvim" },
  build = ":Neorg sync-parsers",
  cmd = "Neorg",
  ft = "norg",
  opts = {
    load = {
      ---Loads default behaviour
      ["core.defaults"] = {},

      ---Get completions in Neorg files
      ["core.completion"] = {
        config = {
          engine = "nvim-cmp",
          name = "(Norg)",
        },
      },

      ---Display Markup as Icons, not Text
      ["core.concealer"] = {
        config = {
          folds = false,
          icon_preset = "varied",
        },
      },

      ---The Most Critical Component of any Organized Workflow
      ["core.dirman"] = {
        config = {
          workspaces = {
            notes = "~/notes",
            kb = "~/kb",
          },
        },
      },

      ---Convert Neorg Files to other Filetypes with core.export
      ["core.export"] = {},
      ---Neorg's Markdown Exporter
      ["core.export.markdown"] = {
        config = {
          extension = "md",
          extensions = "all",
        },
      },

      ---Powerpoint in Neorg
      ["core.presenter"] = {
        config = { zen_mode = "zen-mode" },
      },

      ---Write notes, not boilerplate.
      ["core.summary"] = {},
    },
  },
}
