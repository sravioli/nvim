return {
  settings = {
    Lua = {
      format = { enable = false },
      filetypes = { "lua" },
      runtime = { version = "LuaJIT" },

      diagnostics = {
        enable = true,
        globals = { "vim" },
      },

      hint = {
        enable = true,
        arrayIndex = "Enable",
        setType = true,
      },

      workspace = {
        useGitIgnore = false,
        library = {
          [vim.fn.expand "$VIMRUNTIME/lua"] = true,
          [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
          [vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy"] = true,
        },

        ---adjust these two values if your performance is not optimal
        maxPreload = 2000,
        preloadFileSize = 1000,
      },
    },
  },
}
