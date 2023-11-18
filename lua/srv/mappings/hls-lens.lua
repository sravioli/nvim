---@class Mappings
return {
  autoload = false,

  n = {
    ["n"] = { "nzz<cmd>lua require('hlslens').start()<CR>" },
    ["N"] = { "Nzz<cmd>lua require('hlslens').start()<CR>" },

    ["*"] = { "*zz<cmd>lua require('hlslens').start()<CR>" },
    ["#"] = { "#zz<cmd>lua require('hlslens').start()<CR>" },
    ["g*"] = { "g*zz<cmd>lua require('hlslens').start()<CR>" },
    ["g#"] = { "g#zz<cmd>lua require('hlslens').start()<CR>" },

    ["<leader>L"] = {
      function()
        vim.schedule(function()
          if require("hlslens").exportLastSearchToQuickfix() then
            vim.cmd "cwindow"
          end
        end)
        return ":nohlsearch<CR>"
      end,
      "  export search results to quickfix",
      opts = { expr = true },
    },
  },

  x = {
    ["<leader>L"] = {
      function()
        vim.schedule(function()
          if require("hlslens").exportLastSearchToQuickfix() then
            vim.cmd "cwindow"
          end
        end)
        return ":nohlsearch<CR>"
      end,
      "  export search results to quickfix",
      opts = { expr = true },
    },
  },
}
