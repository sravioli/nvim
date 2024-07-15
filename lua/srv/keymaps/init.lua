local M = {}

M.load = function(plugin)
  return require("srv.keymaps." .. plugin)
end

return M
