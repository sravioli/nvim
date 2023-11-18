return {
  ---🚦 A pretty diagnostics, references, telescope results, quickfix and
  ---location list to help you solve all the trouble your code is causing.
  "folke/trouble.nvim",
  cmd = { "TroubleToggle", "Trouble" },
  opts = { use_diagnostic_signs = true },
  keys = {
    {
      "<leader>xx",
      "<cmd>TroubleToggle document_diagnostics<cr>",
      desc = "󱪗  Document Diagnostics (Trouble)",
    },
    {
      "<leader>xX",
      "<cmd>TroubleToggle workspace_diagnostics<cr>",
      desc = "  Workspace Diagnostics (Trouble)",
    },
    {
      "<leader>xL",
      "<cmd>TroubleToggle loclist<cr>",
      desc = "  Location List (Trouble)",
    },
    {
      "<leader>xQ",
      "<cmd>TroubleToggle quickfix<cr>",
      desc = "󱖫  Quickfix List (Trouble)",
    },
    {
      "[q",
      function()
        if require("trouble").is_open() then
          require("trouble").previous { skip_groups = true, jump = true }
        else
          local ok, err = pcall(vim.cmd.cprevious)
          if not ok then vim.notify(err or "error", vim.log.levels.ERROR) end
        end
      end,
      desc = "󰼨  Previous trouble/quickfix item",
    },
    {
      "]q",
      function()
        if require("trouble").is_open() then
          require("trouble").next { skip_groups = true, jump = true }
        else
          local ok, err = pcall(vim.cmd.cnext)
          if not ok then vim.notify(err or "error", vim.log.levels.ERROR) end
        end
      end,
      desc = "󰼧  Next trouble/quickfix item",
    },
  },
}
