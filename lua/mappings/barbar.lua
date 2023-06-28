local opts = { noremap = true, silent = true }

local mappings = {
  plugin = true,
  n = {
    ["<S-Tab>"] = { ":BufferPrevious<CR>", "Next buffer", opts = opts },
    ["<Tab>"] = { ":BufferNext<CR>", "Prev buffer", opts = opts },
    -- Re-order to previous/next
    ["<A-<>"] = { ":BufferMovePrevious<CR>", "Move buffer left", opts = opts },
    ["<A->>"] = { ":BufferMoveNext<CR>", "Move buffer right", opts = opts },
    -- Goto buffer in position...
    ["<A-1>"] = { ":BufferGoto 1<CR>", "Goto buffer 1", opts = opts },
    ["<A-2>"] = { ":BufferGoto 2<CR>", "Goto buffer 2", opts = opts },
    ["<A-3>"] = { ":BufferGoto 3<CR>", "Goto buffer 3", opts = opts },
    ["<A-4>"] = { ":BufferGoto 4<CR>", "Goto buffer 4", opts = opts },
    ["<A-5>"] = { ":BufferGoto 5<CR>", "Goto buffer 5", opts = opts },
    ["<A-6>"] = { ":BufferGoto 6<CR>", "Goto buffer 6", opts = opts },
    ["<A-7>"] = { ":BufferGoto 7<CR>", "Goto buffer 7", opts = opts },
    ["<A-8>"] = { ":BufferGoto 8<CR>", "Goto buffer 8", opts = opts },
    ["<A-9>"] = { ":BufferGoto 9<CR>", "Goto buffer 9", opts = opts },
    ["<A-0>"] = { ":BufferLast<CR>", "Goto last buffer", opts = opts },
    -- Pin/unpin buffer
    ["<A-p>"] = { ":BufferPin<CR>", "Pin buffer", opts = opts },
    -- Close buffer
    ["<leader>bx"] = { ":BufferClose<CR>", "CLose buffer", opts = opts },
    -- Wipeout buffer
    --                 :BufferWipeout
    -- Close commands
    --                 :BufferCloseAllButCurrent
    --                 :BufferCloseAllButPinned
    --                 :BufferCloseAllButCurrentOrPinned
    --                 :BufferCloseBuffersLeft
    --                 :BufferCloseBuffersRight
    -- Magic buffer-picking mode
    ["<leader>bp"] = { ":BufferPick<CR>", "Pick buffer", opts = opts },
    -- Sort automatically by...
    ["<leader>bb"] = {
      ":BufferOrderByBufferNumber<CR>",
      "Re-order buffers by number",
      opts = opts,
    },
    ["<leader>bd"] = {
      ":BufferOrderByDirectory<CR>",
      "Re-order buffers by directory",
      opts = opts,
    },
    ["<leader>bl"] = {
      ":BufferOrderByLanguage<CR>",
      "Re-order buffers by language",
      opts = opts,
    },
    ["<leader>bw"] = {
      ":BufferOrderByWindowNumber<CR>",
      "Re-order buffers by window number",
      opts = opts,
    },

    -- Other:
    -- :BarbarEnable - enables barbar (enabled by default)
    -- :BarbarDisable - very bad command, should never be used
  },
}

return mappings
