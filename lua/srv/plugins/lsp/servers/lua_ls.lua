return {
  format = {
    enable = false, ---use null-ls
  },

  -- completion = {
  --   enable = true,
  --   callSnippet = "Replace",
  --   keywordSnippet = "Replace",
  --   displayContext = 1,
  -- },

  filetypes = { "lua" },

  runtime = {
    version = "LuaJIT",
  },

  diagnostics = {
    enable = true,
    globals = { "vim" },
  },

  hint = {
    enable = true,
    arrayIndex = "Disable",
  },

  workspace = {
    useGitIgnore = false,
    library = {
      -- vim.api.nvim_get_runtime_file("", true),
      [vim.fn.expand "$VIMRUNTIME/lua"] = true,
      [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
      [vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy"] = true,
    },

    ---adjust these two values if your performance is not optimal
    maxPreload = 2000,
    preloadFileSize = 1000,
  },
}
