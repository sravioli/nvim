---@module "srv.keymaps.neotest"
---@author sravioli
---@license GNU-GPLv3

local fun = require "srv.utils.fun"

local Keymap = require "srv.utils.keymap"
local M = Keymap:create() --[[@class Keymap]]

M:add {
  {
    "<leader>Ts",
    function()
      require("neotest").summary.open()
    end,
    desc = "Neotest summary",
  },
  {
    "<leader>Tr",
    function()
      require("neotest").run.run()
    end,
    desc = "Run nearest test",
  },
  {
    "<leader>Tf",
    function()
      require("neotest").run.run(vim.fn.expand "%")
    end,
    desc = "Run test file",
  },
  {
    "<leader>Td",
    function()
      require("neotest").run.run { strategy = "dap" }
    end,
    desc = "Debug nearest test",
  },
  {
    "<leader>To",
    function()
      require("neotest").output.open()
    end,
  },
}

M:inject { icon = { icon = "󰙨 ", color = "cyan" } }
M:register()

return M
