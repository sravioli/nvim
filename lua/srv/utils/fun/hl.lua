---functions to get highlights
---
---@class Fun.hl
local M = {}

M.get = function(group, attr)
  return vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID(group)), attr)
end

M.get_fg = function(group)
  return vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID(group)), "fg#")
end

M.get_bg = function(group)
  return vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID(group)), "bg#")
end
-- }}}

return M

