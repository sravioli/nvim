---@class Events
local M = {}

M.LazyFile = { "BufReadPost", "BufNewFile", "BufWritePre" }
M.FocusGained = { "FocusGained", "TermClose", "TermLeave" }
M.TriggerLint = { "BufReadPost", "BufWritePost", "InsertLeave" }

return M
