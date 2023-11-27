---@class Mappings
return {
  autoload = false,

  n = {
    ["n"] = { "nzzzv<cmd>lua require('hlslens').start()<CR>" },
    ["N"] = { "Nzzzv<cmd>lua require('hlslens').start()<CR>" },

    ["*"] = { "*zzzv<cmd>lua require('hlslens').start()<CR>" },
    ["#"] = { "#zzzv<cmd>lua require('hlslens').start()<CR>" },
    ["g*"] = { "g*zzzv<cmd>lua require('hlslens').start()<CR>" },
    ["g#"] = { "g#zzzv<cmd>lua require('hlslens').start()<CR>" },

    ["<leader>L"] = {
      function()
        vim.schedule(function()
          if require("hlslens").exportLastSearchToQuickfix() then
            vim.cmd "cwindow"
          end
        end)
        return ":nohlsearch<CR>"
      end,
      "󰈇  export search results to quickfix",
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
      "󰈇  export search results to quickfix",
      opts = { expr = true },
    },
  },
}
