---You can specify multiple source arrays. The sources are grouped in the
---order you specify, and the groups are displayed as a fallback, like chain
---completion.
---@class CmpSources
---@field cmp table sources for cmp when editing files
---@field cmd table
---@field search table
local M = {}

---Sources for cmp while editing files
M.cmp = require("cmp").config.sources({
  ---Snippets
  { name = "luasnip" },
  ---LSP
  {
    name = "nvim_lsp",
    option = { markdown_oxide = { keyword_pattern = [[\(\k\| \|\/\|#\)\+]] } },
  },
  { name = "nvim_lua" },
  { name = "nvim_lsp_document_symbol" },
  { name = "nvim_lsp_signature_help" },
  { name = "lazydev", group_index = 0 },
}, { ---Buffer/Vim-builtin functionality
  {
    name = "buffer",
    option = {
      keyword_length = 4,
      ---A function that specifies the buffer numbers to complete.
      ---@return table bufs List of visible buffers OR empty list if filesize is too large
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
  { name = "rg" },
}, { ---Filesystem paths
  { name = "async_path", option = { trailing_slash = true } },
})

---Sources for when in `/` or `?` mode
M.search = {
  { name = "cmdline_history" },
  { name = "rg" },
  { name = "nvim_lsp_document_symbol" },
  {
    name = "buffer",
    option = {
      keyword_length = 5,
      ---A function that specifies the buffer numbers to complete.
      ---@return table bufs List of visible buffers OR empty list if filesize is too large
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
}

---Sources for when in `:` mode
M.cmd = {
  {
    name = "cmdline",
    option = {
      ignore_cmds = { "Man", "!" },
    },
  },
  { name = "cmdline_history" },
  { name = "async_path" },
}

return M
