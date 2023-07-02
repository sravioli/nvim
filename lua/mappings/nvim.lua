return {
  n = {
    ["<Esc>"] = { ":nohlsearch<CR><Esc>", "Clear search highlights" },

    -- switch between windows
    ["<C-h>"] = { "<C-w>h", "Window left" },
    ["<C-l>"] = { "<C-w>l", "Window right" },
    ["<C-j>"] = { "<C-w>j", "Window down" },
    ["<C-k>"] = { "<C-w>k", "Window up" },

    -- Copy all
    ["<C-c>"] = { ":%yank+<CR>", "Copy whole file" },

    -- line numbers
    ["<leader>n"] = { ":set number!<CR>", "Toggle line number" },
    ["<leader>nr"] = { ":set relativenumber!<CR>", "Toggle relative number" },

    -- Allow moving the cursor through wrapped lines with j, k, <Up> and <Down>
    -- http://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
    -- empty mode is same as using <cmd> :map
    -- also don't use g[j|k] when in operator pending mode, so it doesn't alter d, y or c behaviour
    ["j"] = {
      'v:count || mode(1)[0:1] == "no" ? "j" : "gj"',
      "Move down",
      opts = { expr = true },
    },
    ["k"] = {
      'v:count || mode(1)[0:1] == "no" ? "k" : "gk"',
      "Move up",
      opts = { expr = true },
    },
    ["<Up>"] = {
      'v:count || mode(1)[0:1] == "no" ? "k" : "gk"',
      "Move up",
      opts = { expr = true },
    },
    ["<Down>"] = {
      'v:count || mode(1)[0:1] == "no" ? "j" : "gj"',
      "Move down",
      opts = { expr = true },
    },

    ["<C-s>"] = { ":write<CR>", "Save File" },
    ["<C-z>"] = { ":undo<CR>", "Undo action" },

    -- do thing, then center screen to allow for better readability
    ["<C-u>"] = { "<C-u>zz" },
    ["<C-d>"] = { "<C-d>zz" },
    ["n"] = { "nzzzv" },
    ["N"] = { "Nzzzv" },
    ["]]"] = { "]]zz" },
    ["[["] = { "[[zz" },

    -- open code actions kinda like VSCode
    -- ["<M-.>"] = { ":CodeActionMenu<CR>", "Open code actions" },

    ["<leader>nf"] = { ":Neogen<CR>", "Generate docstrings with Neogen" },
    ["<M-j>"] = { "ddp", "move line down" },
    ["<M-k>"] = { "ddkP", "move line up" },
  },

  i = {
    ["<Esc>"] = { "<Esc>:nohlsearch<CR>", "Clear highlights" },
    ["jk"] = { "<Esc>", "Exit insert mode", opts = { nowait = true } },

    -- same normal mappings for insert mode also
    ["<C-s>"] = { "<C-o>:write<CR>", "Save file" },
    ["<C-z>"] = { "<C-o>:undo<CR>", "Undo action" },

    -- ["<M-.>"] = { "<C-o>:CodeActionMenu<CR>", "Open code actions" },

    -- delete line directily in insert mode
    ["<M-k>"] = { "<C-o>dd", "Delete line" },

    -- C-w but backwards
    ["<C-Del>"] = { "<C-o>dw", "Delete word backwards" },
    ["<S-Del>"] = { "<C-o><S-d>", "Delete everything from cursor to right" },
    ["<M-BS>"] = { "<C-u>", "Delete everything from cursor to left" },

    -- undo break-points
    [","] = { ",<c-g>u", "Add undo break points" },
    ["."] = { ".<c-g>u", "Add undo break points" },
    [";"] = { ";<c-g>u", "Add undo break points" },
  },

  t = {
    ["<Esc>"] = { "<C-\\><C-n>", "Escape terminal mode" },
    ["jk"] = { "<C-\\><C-n>", "Escape terminal mode" },
  },

  v = {
    ["<Up>"] = {
      'v:count || mode(1)[0:1] == "no" ? "k" : "gk"',
      "Move up",
      opts = { expr = true },
    },
    ["<Down>"] = {
      'v:count || mode(1)[0:1] == "no" ? "j" : "gj"',
      "Move down",
      opts = { expr = true },
    },
  },

  x = {
    ["j"] = {
      'v:count || mode(1)[0:1] == "no" ? "j" : "gj"',
      "Move down",
      opts = { expr = true },
    },
    ["k"] = {
      'v:count || mode(1)[0:1] == "no" ? "k" : "gk"',
      "Move up",
      opts = { expr = true },
    },
    -- Don't copy the replaced text after pasting in visual mode
    -- https://vim.fandom.com/wiki/Replace_a_word_with_yanked_text#Alternative_mapping_for_paste
    ["p"] = {
      'p:let @+=@0<CR>:let @"=@0<CR>',
      "Dont copy replaced text",
      opts = { silent = true },
    },
  },
}
