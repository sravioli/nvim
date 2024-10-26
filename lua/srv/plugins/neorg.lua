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
      ["core.concealer"] = {
        config = {
          code_block = {
            conceal = true,
            content_only = false,
          },
        },
      },
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
      ["core.keybinds"] = {
        config = {
          hook = function(keybinds)
            local ll = keybinds.localleader
            local function map(mode, lhs, rhs)
              keybinds.remap_event("norg", mode, lhs, rhs)
            end
            map("i", "<C-CR>", "core.itero.next-iteration")
            map("n", "<up>", "neorg.text-objects.item-up")
            map("n", "<down>", "neorg.text-objects.item-down")
            map({ "o", "x" }, "iH", "neorg.text-objects.textobject.heading.inner")
            map({ "o", "x" }, "aH", "neorg.text-objects.textobject.heading.outer")
            map("n", ll .. "cm", "neorg.looking-glass.magnify-code-block")
            map("n", ll .. "id", "neorg.tempus.insert-date")
            map("n", ll .. "li", "neorg.pivot.list.invert")
            map("n", ll .. "lt", "neorg.pivot.list.toggle")
            map("n", ll .. "ta", "neorg.qol.todo-items.todo.task-ambiguous")
            map("n", ll .. "tc", "neorg.qol.todo-items.todo.task-cancelled")
            map("n", ll .. "td", "neorg.qol.todo-items.todo.task-done")
            map("n", ll .. "th", "neorg.qol.todo-items.todo.task-on-hold")
            map("n", ll .. "ti", "neorg.qol.todo-items.todo.task-important")
            map("n", ll .. "tp", "neorg.qol.todo-items.todo.task-pending")
            map("n", ll .. "tr", "neorg.qol.todo-items.todo.task-recurring")
            map("n", ll .. "tu", "neorg.qol.todo-items.todo.task-undone")
          end,
        },
      },
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
