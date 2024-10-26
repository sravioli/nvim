return {
  "nvim-neorg/neorg",
  version = "*",
  ft = "norg",
  dependencies = {
    "benlubas/neorg-conceal-wrap",
    "opipoy/neorg-colors",
  },
  build = ":Neorg sync-parsers",
  opts = {
    load = {
      ["core.clipboard"] = {},
      ["core.clipboard.code-blocks"] = {},
      ["core.completion"] = { config = { engine = "nvim-cmp" } },
      ["core.concealer"] = { config = { code_block = { conceal = true } } },
      ["core.defaults"] = {},
      ["core.dirman"] = {
        config = {
          workspaces = {
            kb = "~/Documents/knowledge-base/",
          },
        },
      },
      ["core.esupports.hop"] = {},
      ["core.esupports.indent"] = {},
      ["core.esupports.metagen"] = {
        config = {
          author = "sravioli",
          timezone = "local",
          type = "auto",
        },
      },
      ["core.export"] = {},
      ["core.export.markdown"] = { config = { extensions = "all" } },
      ["core.integrations.nvim-cmp"] = {},
      ["core.itero"] = {},
      ["core.keybinds"] = {},
      ["core.looking-glass"] = {},
      ["core.neorgcmd"] = {},
      ["core.neorgcmd.commands.return"] = {},
      ["core.pivot"] = {},
      ["core.promo"] = {},
      ["core.qol.toc"] = {},
      ["core.qol.todo_items"] = {},
      ["core.summary"] = { config = { strategy = "by_path" } },
      ["core.text-objects"] = {},
      ["core.todo-introspector"] = {},

      ["external.conceal-wrap"] = {},
      ["external.neorg-colors"] = {},
    },
  },
}
