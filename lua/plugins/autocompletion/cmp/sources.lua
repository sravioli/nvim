local cmp = require "cmp"

return {
  ---You can specify multiple source arrays. The sources are grouped in the
  ---order you specify, and the groups are displayed as a fallback, like chain
  ---completion.

  ---Sources for cmp while editing files
  cmp = cmp.config.sources({
    ---Snippets
    { name = "luasnip" },
    ---LSP
    { name = "nvim_lsp" },
    { name = "nvim_lua" },
    { name = "nvim_lsp_document_symbol" },
    { name = "nvim_lsp_signature_help" },
    ---Buffer/Vim-builtin functionality
  }, {
    {
      name = "buffer",
      option = {
        keyword_length = 4,
        ---A function that specifies the buffer numbers to complete.
        ---@return table bufs A list of visible buffers OR an empty list if the filesize is too large
        get_bufnrs = function()
          if
            vim.api.nvim_buf_get_offset(
              vim.api.nvim_get_current_buf(),
              vim.api.nvim_buf_line_count(vim.api.nvim_get_current_buf())
            ) > 1024 * 1024 -- 1 Megabyte max
          then
            return {}
          end

          local bufs = {}
          for _, win in ipairs(vim.api.nvim_list_wins()) do
            bufs[vim.api.nvim_win_get_buf(win)] = true
          end
          return vim.tbl_keys(bufs)
        end,
      },
    },
    { name = "buffer-lines", option = { leading_whitespace = false } },
    { name = "rg" },
    { name = "calc" },
    { name = "rpncalc" },
    -- { name = "digraphs" },
  }, { ---Filesystem paths
    { name = "async_path", option = { trailing_slash = true } },
  }, { ---Git
    { name = "conventionalcommits" },
  }, { ---Miscellaneous
    { name = "emoji" },
    { name = "nerdfont" },
    { name = "latex_symbols" },
    { name = "treesitter" },
    { name = "neorg" },
  }),

  ---Sources for when in `/` or `?` mode
  search = {
    { name = "cmdline_history" },
    { name = "rg" },
    { name = "nvim_lsp_document_symbol" },
    {
      name = "buffer",
      option = {
        keyword_length = 5,
        ---A function that specifies the buffer numbers to complete.
        ---@return table bufs A list of visible buffers OR an empty list if the filesize is too large
        get_bufnrs = function()
          if
            vim.api.nvim_buf_get_offset(
              vim.api.nvim_get_current_buf(),
              vim.api.nvim_buf_line_count(vim.api.nvim_get_current_buf())
            ) > 1024 * 1024 -- 1 Megabyte max
          then
            return {}
          end

          local bufs = {}
          for _, win in ipairs(vim.api.nvim_list_wins()) do
            bufs[vim.api.nvim_win_get_buf(win)] = true
          end
          return vim.tbl_keys(bufs)
        end,
      },
    },
  },

  ---Sources for when in `:` mode
  cmd = {
    {
      name = "cmdline",
      option = {
        ignore_cmds = { "Man", "!" },
      },
    },
    { name = "cmdline_history" },
    { name = "async_path" },
  },
}
