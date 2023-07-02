local opts = { noremap = true, silent = true }

return {
  plugin = true,

  n = {
    ["<S-Tab>"] = { "<cmd>BufferPrevious<CR>", "Next buffer", opts = opts },
    ["<Tab>"] = { "<cmd>BufferNext<CR>", "Prev buffer", opts = opts },
    -- Re-order to previous/next
    ["<A-<>"] = { "<cmd>BufferMovePrevious<CR>", "Move buffer left", opts = opts },
    ["<A->>"] = { "<cmd>BufferMoveNext<CR>", "Move buffer right", opts = opts },
    -- Goto buffer in position...
    ["<A-1>"] = { "<cmd>BufferGoto 1<CR>", "Goto buffer 1", opts = opts },
    ["<A-2>"] = { "<cmd>BufferGoto 2<CR>", "Goto buffer 2", opts = opts },
    ["<A-3>"] = { "<cmd>BufferGoto 3<CR>", "Goto buffer 3", opts = opts },
    ["<A-4>"] = { "<cmd>BufferGoto 4<CR>", "Goto buffer 4", opts = opts },
    ["<A-5>"] = { "<cmd>BufferGoto 5<CR>", "Goto buffer 5", opts = opts },
    ["<A-6>"] = { "<cmd>BufferGoto 6<CR>", "Goto buffer 6", opts = opts },
    ["<A-7>"] = { "<cmd>BufferGoto 7<CR>", "Goto buffer 7", opts = opts },
    ["<A-8>"] = { "<cmd>BufferGoto 8<CR>", "Goto buffer 8", opts = opts },
    ["<A-9>"] = { "<cmd>BufferGoto 9<CR>", "Goto buffer 9", opts = opts },
    ["<A-0>"] = { "<cmd>BufferLast<CR>", "Goto last buffer", opts = opts },
    -- Pin/unpin buffer
    ["<A-p>"] = { "<cmd>BufferPin<CR>", "Pin buffer", opts = opts },
    -- Close buffer
    ["<leader>bx"] = { "<cmd>BufferClose<CR>", "CLose buffer", opts = opts },
    -- Wipeout buffer
    --                 <cmd>BufferWipeout
    -- Close commands
    --                 <cmd>BufferCloseAllButCurrent
    --                 <cmd>BufferCloseAllButPinned
    --                 <cmd>BufferCloseAllButCurrentOrPinned
    --                 <cmd>BufferCloseBuffersLeft
    --                 <cmd>BufferCloseBuffersRight
    -- Magic buffer-picking mode
    ["<leader>bp"] = { "<cmd>BufferPick<CR>", "Pick buffer", opts = opts },
    -- Sort automatically by...
    ["<leader>bb"] = {
      "<cmd>BufferOrderByBufferNumber<CR>",
      "Re-order buffers by number",
      opts = opts,
    },
    ["<leader>bd"] = {
      "<cmd>BufferOrderByDirectory<CR>",
      "Re-order buffers by directory",
      opts = opts,
    },
    ["<leader>bl"] = {
      "<cmd>BufferOrderByLanguage<CR>",
      "Re-order buffers by language",
      opts = opts,
    },
    ["<leader>bw"] = {
      "<cmd>BufferOrderByWindowNumber<CR>",
      "Re-order buffers by window number",
      opts = opts,
    },

    -- Other<cmd>
    -- :BarbarEnable - enables barbar (enabled by default)
    -- :BarbarDisable - very bad command, should never be used
  },
}
