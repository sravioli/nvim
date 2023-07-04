return {
  ---A UI for nvim-dap
  "rcarriga/nvim-dap-ui",
  enabled = false,
  dependencies = { "mfussenegger/nvim-dap" },
  config = true,
  event = "LspAttach",
}
