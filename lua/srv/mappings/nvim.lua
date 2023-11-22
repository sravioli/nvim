---@class Mappings
return {
  autoload = true,

  n = {
    ["<Esc>"] = { "<cmd>nohlsearch<CR><Esc>", "  Clear search highlights" },

    ---switch between windows
    ["<C-h>"] = { "<C-w>h", "  Window left" },
    ["<C-l>"] = { "<C-w>l", "  Window right" },
    ["<C-j>"] = { "<C-w>j", "  Window down" },
    ["<C-k>"] = { "<C-w>k", "  Window up" },

    ---Copy all
    ["<C-c>"] = { "<cmd>%yank+<CR>", "  Copy file contents" },

    ---Select all
    ["<M-a>"] = { "gg0vG$", "󰒉  Select whole file" },

    ---line numbers
    ["<leader>n"] = { "<cmd>set number!<CR>", "󰔡  Toggle line number" },
    ["<leader>nr"] = {
      "<cmd>set relativenumber!<CR>",
      "󰔡  Toggle relative number",
    },

    ["<leader>l"] = { "<cmd>Lazy<CR>", "󰒲  Open Lazy" },

    ---Allow moving the cursor through wrapped lines with j, k, <Up> and <Down>
    ---http://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
    ---empty mode is same as using <cmd> :map
    ---also don't use g[j|k] when in operator pending mode, so it doesn't alter d, y or c
    ---behaviour
    ["j"] = {
      'v:count || mode(1)[0:1] == "no" ? "j" : "gj"',
      "  Move down",
      opts = { expr = true },
    },
    ["k"] = {
      'v:count || mode(1)[0:1] == "no" ? "k" : "gk"',
      "  Move up",
      opts = { expr = true },
    },
    ["<Up>"] = {
      'v:count || mode(1)[0:1] == "no" ? "k" : "gk"',
      "  Move up",
      opts = { expr = true },
    },
    ["<Down>"] = {
      'v:count || mode(1)[0:1] == "no" ? "j" : "gj"',
      "  Move down",
      opts = { expr = true },
    },

    ["<C-s>"] = { "<cmd>write<CR>", "󰆓  Save File" },
    ["<C-z>"] = { "<cmd>undo<CR>", "  Undo action" },

    ---do thing, then center screen to allow for better readability
    ["<C-u>"] = { "<C-u>zz", "  Move half window up" },
    ["<C-d>"] = { "<C-d>zz", "  Move half window down" },
    ["n"] = { "nzzzv", "󰒭  Next search result" },
    ["N"] = { "Nzzzv", "󰒮  Prev search result" },
    ["]]"] = { "]]zz" },
    ["[["] = { "[[zz" },

    -- ["<leader>nf"] = { "<cmd>Neogen<CR>", "Generate docstrings with Neogen" },
    ["<M-k>"] = { "<cmd>move .-2<CR>==", "  move line up" },
    ["<M-j>"] = { "<cmd>move .+1<CR>==", "  move line down" },

    ---Toggle typewriter mode
    ["<leader>tT"] = {
      function()
        require("srv.utils.fn").typewriter_toggle()
      end,
      "󰔡  Toggle typewriter scrolling",
    },

    ["<M-d>"] = {
      function()
        require("srv.utils.duck").hatch()
      end,
      "🦆  hatch a duck",
    },
    ["<M-c>"] = {
      function()
        require("srv.utils.duck").cook()
      end,
      "🍳  cook a duck",
    },

    ---select just pasted text
    ["<leader>p"] = { "`[v`]", "󰒅  Select pasted text" },
  },

  i = {
    ["<Esc>"] = { "<Esc><cmd>nohlsearch<CR>", "Clear highlights" },
    ["jk"] = { "<Esc>", "Exit insert mode", opts = { nowait = true } },

    ---same normal mappings for insert mode also
    ["<C-s>"] = { "<cmd>write<CR>", "󰆓  Save file" },
    ["<C-z>"] = { "<cmd>undo<CR>", "  Undo action" },

    ["<M-.>"] = { "<C-o><cmd>CodeActionMenu<CR>", "󱐋  Open code actions" },

    ---Move lines
    ["<M-k>"] = { "<cmd>move .-2<CR><C-o>==", "  move line up" },
    ["<M-j>"] = { "<cmd>move .+1<CR><C-o>==", "  move line down" },
    -- ["<M-j>"] = { "<Esc>:move .+1<CR>==i", "  move line down" },
    -- ["<M-k>"] = { "<Esc>:move .-2<CR>==i", "  move line up" },

    ---C-w but backwards
    ["<C-Del>"] = { "<C-o>dw", "󰭜  Delete word backwards" },
    ["<S-Del>"] = { "<C-o><S-d>", "󰭜  Delete everything from cursor to right" },
    ["<M-BS>"] = { "<C-u>", "󰹿  Delete everything from cursor to left" },

    -- ["<C-S-v>"] = { "<C-o>p" },

    ---undo break-points
    [","] = { ",<C-g>u", "󰕌  Add undo break-points" },
    ["."] = { ".<C-g>u", "󰕌  Add undo break-points" },
    [";"] = { ";<C-g>u", "󰕌  Add undo break-points" },
    [" "] = { " <C-g>u", "󰕌  Add undo break-points" },
  },

  t = {
    ["<Esc>"] = { "<C-\\><C-n>", "󰩈  Escape terminal mode" },
    ["jk"] = { "<C-\\><C-n>", "󰩈  Escape terminal mode" },
  },

  v = {
    ["<Up>"] = {
      'v:count || mode(1)[0:1] == "no" ? "k" : "gk"',
      "  Move up",
      opts = { expr = true },
    },
    ["<Down>"] = {
      'v:count || mode(1)[0:1] == "no" ? "j" : "gj"',
      "  Move down",
      opts = { expr = true },
    },
    ---Move lines
    ["<M-k>"] = { ":move '<-2<CR>gv=gv", "  move line up" },
    ["<M-j>"] = { ":move '>+1<CR>gv=gv", "  move line down" },
  },

  x = {
    ["j"] = {
      'v:count || mode(1)[0:1] == "no" ? "j" : "gj"',
      "  Move down",
      opts = { expr = true },
    },
    ["k"] = {
      'v:count || mode(1)[0:1] == "no" ? "k" : "gk"',
      "  Move up",
      opts = { expr = true },
    },
    ---Don't copy the replaced text after pasting in visual mode
    ["p"] = {
      'p:let @+=@0<CR>:let @"=@0<CR>',
      "  Dont copy replaced text",
      opts = { silent = true },
    },
  },
}
