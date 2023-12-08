---functions to interact with nvim-lint
---
---@class Fun.linter
local M = {}

---Extends the given linter table.
---
---@param linter table `nvim-lint` linter.
---@param args table|fun(): table table of arguments to add to `linter`.
---@param behavior? "force"|"keep"|"error" for `vim.tbl_deep_extend`. default: `"force"`
---@return table new_linter copy of `linter` with the new args.
---@see vim.tbl_deep_extend
---@see vim.deepcopy
M.extend = function(linter, args, behavior)
  if type(args) == "function" then
    args = args()
  elseif type(args) == "table" then
    for key, value in pairs(args) do
      if type(value) == "function" then
        args[key] = value()
      end
    end
  end

  return vim.tbl_deep_extend(behavior or "force", vim.deepcopy(linter), args)
end

---Extends the given linter args.
---
---@param args table `nvim-lint` linter args.
---@param extra_args table|fun(): table table of arguments to add to args.
---@return table extended_args table with the old and new args.
---@see vim.list_extend
---@see vim.deepcopy
M.extend_args = function(args, extra_args)
  if type(extra_args) == "function" then
    extra_args = extra_args()
  end
  return vim.list_extend(vim.deepcopy(args or {}), extra_args)
end

return M

