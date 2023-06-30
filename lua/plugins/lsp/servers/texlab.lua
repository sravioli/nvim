return {
  auxDirectory = "build",

  build = {
    executable = "latexmk",
    args = {
      "-pdf",
      "-interaction=nonstopmode",
      "-synctex=1",
      "-outdir=build",
      "%f",
    },
    forwardSearchAfter = true,
    onSave = true,
  },

  forwardSearch = {
    executable = "sioyek.exe",
    args = {
      "--reuse-window",
      "--execute-command",
      "toggle_synctex", -- Open Sioyek in synctex mode.
      "--inverse-search",
      [[nvim --headless -c "Lazy load nvim-lspconfig" %f -c "%l" --server ]]
        .. vim.v.servername,
      "--forward-search-file",
      "%f",
      "--forward-search-line",
      "%l",
      "%p",
    },
  },
  bibtexFormatter = "texlab",
  chktex = {
    onEdit = false,
    onOpenAndSave = true,
  },
  diagnosticsDelay = 300,
  formatterLineLength = 80,
  latexFormatter = "latexindent",
  latexindent = {
    modifyLineBreaks = true,
  },
}
