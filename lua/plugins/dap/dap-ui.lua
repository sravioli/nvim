return {
  ---A UI for nvim-dap
  "rcarriga/nvim-dap-ui",
  dependencies = { "mfussenegger/nvim-dap" },
  config = true,
  event = "LspAttach",
}
