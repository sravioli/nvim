return {
  ---Modernity meets insane extensibility. The future of organizing your life
  ---in Neovim.
  "nvim-neorg/neorg",
  dependencies = { "nvim-lua/plenary.nvim" },
  build = ":Neorg sync-parsers",
  cmd = "Neorg",
  ft = "norg",
  init = function() vim.g.localleader = "\\" end,
  opts = {
    load = {
      ---Loads default behaviour
      ["core.defaults"] = {},

      ---Manually Writing Metadata? No Thanks
      ["core.esupports.metagen"] = {
        config = {
          template = {
            ---The title field generates a title for the file based on the filename.
            {
              "title",
              function() return vim.fn.expand "%:p:t:r" end,
            },

            ---The description field is always kept empty for the user to fill in.
            { "description", "" },

            ---The authors field is autopopulated by querying the current user's system username.
            {
              "authors",
              function() return require("neorg.external.helpers").get_username() end,
            },

            ---The categories field is always kept empty for the user to fill in.
            { "categories", "" },

            ---The created field is populated with the current date as returned by `os.date`.
            {
              "created",
              function() return os.date "%Y-%m-%d %H:%M" end,
            },

            ---When creating fresh, new metadata, the updated field is populated the same way
            ---as the `created` date.
            {
              "updated",
              function() return os.date "%Y-%m-%d %H:%M" end,
            },

            ---The version field determines which Norg version was used when the file
            ---was created.
            {
              "version",
              function() return require("neorg.config").norg_version end,
            },
          },
          type = "auto",
          update_date = true,
        },
      },

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
          ---Configuration for icons.
          ---This table contains the full configuration set for each icon, including
          ---its query (where to be placed), render functions (how to be placed) and
          ---characters to use.
          ---
          ---For most use cases, the only values that you should be changing is the
          ---`icon`/`icons` field. `icon` is a string, while `icons` is a table of
          ---strings for multilevel elements like headings, lists, and quotes.
          ---
          ---To disable part of the config, replace the table with false, or prepend
          ---false and to it. For example: `done = false` or `done = false and { ... }`.
          icons = {
            code_block = {
              ---Options that control the behaviour of code block dimming (placing a
              ---darker background behind @code tags).
              conceal = true,
              ---If true will only dim the content of the code block (without the
              ---`@code` and `@end` lines), not the entirety of the code block itself.
              content_only = true,
              ---Additional padding to apply to either the left or the right. Making
              ---these values negative is considered undefined behaviour (it is likely
              ---to work, but it's not officially supported).
              padding = { left = 0, right = 0 },
              ---The width to use for code block backgrounds.
              ---When set to `fullwidth` (the default), will create a background that
              ---spans the width of the buffer.
              ---When set to `content`, will only span as far as the longest line
              ---within the code block.
              width = "content",
            },
            definition = {
              multi_prefix = { icon = "󰸖 " },
              multi_suffix = { icon = "󰧏" },
              single = { icon = "󰃃 " },
            },
            quote = {
              icons = { "│ " },
            },
            todo = {
              cancelled = { icon = "" },
              done = { icon = "" },
              on_hold = { icon = "" },
              pending = { icon = "󰅐" },
              recurring = { icon = "󰑓" },
              uncertain = { icon = "" },
              undone = { icon = "" },
              urgent = { icon = "" },
            },
          },
        },
      },

      ---The Most Critical Component of any Organized Workflow
      ["core.dirman"] = {
        config = {
          workspaces = {
            ["knowledge-base"] = "~/knowledge-base",
            -- L31 = "~/kb/L31",
            -- coding = "~/kb/Coding",
            -- OS = "~/kb/OS",
            -- nvim = "~/kb/NeoVim",
          },
          default_workspace = "knowledge-base",
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
