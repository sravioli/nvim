---@class Fun
---@field fmt       Fun.fmt
---@field hl        Fun.hl
---@field keymaps   Fun.keymaps
---@field linter    Fun.linter
---@field lsp       Fun.lsp
---@field providers Fun.providers
---@field telescope Fun.telescope
---@field tree      Fun.tree
---@field has       function
local M = {}

local insert = table.insert

-- {{{1 some misc functions

---Wrapper for `:h has()`
---
---@param feature any the feature to check
---@return true|false result
M.has = function(feature)
  return vim.fn.has(feature) == 1
end

local uv = vim.loop
if M.has "nvim-0.10.0" then
  uv = vim.uv
end

---Strips whitespace, punctuation and control chars from string
---
---@param s     string input string
---@param pat?  string pattern to use to strip chars. default: `"[%p%c%s]"`
---@param repl? string replacement string. default: `""`
---@return string  str   copy of `s` without chars from pattern
---@return integer count total number of matches that occurred
M.strip = function(s, pat, repl)
  return s:gsub(pat or "[%p%c%s]", repl or "")
end

---Retrieves the sysname and machine architecture
---
---@return string sysname name of the system
---@return string machine machine architecture
M.os_info = function()
  return uv.os_uname().sysname:lower(), uv.os_uname().machine:lower()
end

---Executes a function when a plugin is loaded.
---
---@param name string            name of the plugin.
---@param fn   fun(name: string) function to be executed when the plugin is loaded.
M.on_load = function(name, fn)
  local Config = require "lazy.core.config"
  if Config.plugins[name] and Config.plugins[name]._.loaded then
    fn(name)
  else
    vim.api.nvim_create_autocmd("User", {
      pattern = "LazyLoad",
      callback = function(event)
        if event.data == name then
          fn(name)
          return true
        end
      end,
    })
  end
end

---Executes a function on the VeryLazy event
---@param fn function: fun()
M.on_very_lazy = function(fn)
  vim.api.nvim_create_autocmd("User", {
    pattern = "VeryLazy",
    callback = function()
      fn()
    end,
  })
end

---Defers notifications loading for 500ms or until nvim-notify is loaded
M.lazy_notify = function()
  local notifs = {}
  local function temp(...)
    insert(notifs, vim.F.pack_len(...))
  end

  local orig = vim.notify
  vim.notify = temp

  local timer = vim.loop.new_timer()
  if timer == nil then
    return
  end

  local check = assert(vim.loop.new_check())

  local replay = function()
    timer:stop()
    check:stop()
    if vim.notify == temp then
      vim.notify = orig -- put back the original notify if needed
    end
    vim.schedule(function()
      ---@diagnostic disable-next-line: no-unknown
      for _, notif in ipairs(notifs) do
        vim.notify(vim.F.unpack_len(notif))
      end
    end)
  end

  -- wait till vim.notify has been replaced
  check:start(function()
    if vim.notify ~= temp then
      replay()
    end
  end)
  -- or if it took more than 800ms, then something went wrong
  timer:start(800, 0, replay)
end

---Searches for the given file
---
---It will search the following directories in this order:
---
---1. directory of the current open file (`vim.fn.expand "%:p:h"`).
---2. if lspconfig is loaded:
---   2a. git ancestor (`require("lspconfig.util").find_git_ancestor()`).
---   2b. node_modules ancestor (`require("lspconfig.util").find_node_modules_ancestor()`).
---   2c. package.json ancestor (`require("lspconfig.util").find_package_json_ancestor()`).
---3. current working directory (`vim.(loop/uv).cwd()`).
---4. neovim config directory, skel folder (`vim.fn.stdpath "config" .. "/skel"`).
---@param ...  string|string[] single filename or list of filenames.
---@return string|nil file first found path or nil if none found.
M.search_file = function(...)
  local filenames = vim.iter({ ... }):flatten():totable()
  local directories = { vim.fn.expand "%:p:h" }

  local ls_present, ls_utils = pcall(require, "lspconfig.utils")
  if ls_present then
    insert(directories, (ls_utils.find_git_ancestor()))
    insert(directories, (ls_utils.find_node_modules_ancestor()))
    insert(directories, (ls_utils.find_package_json_ancestor()))
  end

  insert(directories, (uv.cwd()))
  insert(directories, vim.fn.resolve(vim.fn.stdpath "config" .. "/skel"))

  directories = vim.iter(directories):flatten():totable()
  local log_msg, log_lvl = "[search] %s path: %s", vim.log.levels.TRACE
  for _, filename in ipairs(filenames) do
    for _, directory in pairs(directories) do
      local filepath = vim.fn.resolve(("%s/%s"):format(directory, filename))

      -- vim.notify(log_msg:format("󰍉", filepath), log_lvl)
      local file = vim.fn.findfile(filepath)
      if file ~= "" then
        vim.notify(log_msg:format("󰄬", filepath), log_lvl)
        return file
      end
    end
  end
  return nil
end
-- }}}

setmetatable(M, {
  __index = function(t, k)
    t[k] = require("utils.fun." .. k)
    return t[k]
  end,
})

return M
