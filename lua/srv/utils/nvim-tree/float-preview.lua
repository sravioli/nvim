---@class FloatPreview
local M = {}

---@class NvimTreeExtensionsHelpers
local utils = require "srv.utils.nvim-tree.helpers"
local api = require "nvim-tree.api"

local augroup = vim.api.nvim_create_augroup("FloatPreview", { clear = true })

---@private
---
---Holds the FloatPreview state
M.state = {}

---@private
---
---All the FloatPreview floats
M.floats = {}

---@private
---
---Whether the preview should be disabled or not
M.disabled = false

---@private
---
---Configuration for the FloatPreview class
---
---@class FloatPreview.Config
M.config = {
  -- lines for scroll
  scroll_lines = 20,

  -- window config
  window = {
    width = math.ceil(vim.opt.columns:get() * 0.5),
    height = math.ceil(vim.opt.lines:get() * 0.5),
    style = "minimal",
    relative = "win",
    border = "rounded",
    wrap = false,
  },
  mapping = {
    -- scroll down float buffer
    down = { "<C-d>" },

    -- scroll up float buffer
    up = { "<C-e>", "<C-u>" },

    -- enable/disable float windows
    toggle = { "<C-x>" },
  },

  -- hooks if return false preview doesn't shown
  hooks = {
    pre_open = function(path)
      local fs = utils.fs

      ---don't preview if file sisze is bigger than 5MB OR file isn't a text file (binary)
      local size = fs.get_file_size(path)
      if type(size) ~= "number" then return false end
      return size < 5 and fs.is_text_file(path)
    end,

    ---@diagnostic disable-next-line: unused-local
    post_open = function(bufnr) return true end,
  },
}

---@private
---
---Creates a new instance of FloatPreview.
---
---This constructor function initializes a new FloatPreview object with default
---properties and returns the instance.
---
---@return FloatPreview self The new instance of FloatPreview.
function M:new()
  ---@private
  self.FloatPreview = {
    buf = nil,
    win = nil,
    path = nil,
    current_line = 1,
    max_line = 999999,
    disabled = false,
    config = M.config,
  }

  self = setmetatable(self.FloatPreview, { __index = M })

  return self
end

---@private
---
---Toggles the visibility of all float windows.
---
---If float windows are currently disabled, this function opens all of them.
---If float windows are currently enabled, this function closes all of them.
function M:toggle()
  M.disabled = not M.disabled

  if M.disabled then
    utils.window.close_all(M.floats)
  else
    utils.window.open_all(M.floats)
  end
end

---@private
---
---Closes the current float window associated with the FloatPreview instance.
---
---This function is responsible for closing the float window and cleaning up associated data.
---
---@param reason string|nil: An optional reason for closing the float window, logged with vim TRACE level.
---@see FloatPreview.Helpers.Log
---@see vim.log.levels
function M:close(reason)
  ---nothing to close
  if not self.path and not self.buf then
    utils.log.trace "no buffer to close"
    return
  end

  if reason then utils.log.trace("close reason %s", reason) end

  --- Attempt to close the float window and delete the buffer.
  pcall(vim.api.nvim_win_close, self.win, { force = true })
  pcall(vim.api.nvim_buf_delete, self.buf, { force = true })

  self.win = nil
  M.state[self.buf] = nil
  M.state[self.path] = nil
  self.buf = nil ---@private
  self.path = nil ---@private
  self.current_line = 1 ---@private
  self.max_line = 999999 ---@private
end

---@private
---
---Opens a new float window to preview the contents of a file.
---
---This function reads the contents of the file at the provided path asynchronously,
---creates a new buffer, and opens a float window to display the file contents.
---
---@param path string The path of the file to preview.
function M:preview(path)
  if M.disabled then return end

  ---execute the pre-open hook, and if it returns false, abort the preview.
  if not self.config.hooks.pre_open(path) then return end

  ---set the path and create a new buffer for the preview.
  self.path = path
  self.buf = vim.api.nvim_create_buf(false, false)
  M.state[self.path] = 1
  M.state[self.buf] = 1

  ---configure buffer options for the preview.
  vim.api.nvim_set_option_value("bufhidden", "wipe", { buf = self.buf })
  vim.api.nvim_set_option_value("buftype", "nowrite", { buf = self.buf })
  vim.api.nvim_set_option_value("buflisted", false, { buf = self.buf })

  ---configure window options for the preview.
  local opts = {
    width = self.config.window.width,
    height = self.config.window.height,
    row = vim.fn.line ".",
    col = vim.fn.winwidth(0) + 1,
    focusable = false,
    noautocmd = true,
    style = self.config.window.style,
    relative = self.config.window.relative,
    border = self.config.window.border,
  }

  ---@private
  self.win = vim.api.nvim_open_win(self.buf, true, opts)
  vim.api.nvim_set_option_value("wrap", self.config.window.wrap, { win = self.win })

  ---asynchronously read the file contents and update the buffer.
  utils.fs.read_file_async(
    path,
    vim.schedule_wrap(function(data)
      local lines = vim.split(data, "[\r]?\n")

      ---if the file ends with a newline, don't write an empty string as the last line.
      if data:sub(#data, #data) == "\n" or data:sub(#data - 1, #data) == "\r\n" then
        table.remove(lines)
      end

      ---update `max_line` based on the number of lines in the file.
      self.max_line = #lines

      ---adjust window height if the number of lines is less than the configured height.
      if self.max_line < self.config.window.height then
        opts.height = self.max_line + 1
        opts.noautocmd = nil
        vim.api.nvim_win_set_config(self.win, opts)
      end

      ---set the lines in the buffer and determine the file type for syntax highlighting.
      vim.api.nvim_buf_set_lines(self.buf, 0, -1, false, lines)
      local ft = vim.filetype.match { buf = self.buf, filename = path }
      ft = ft or ""

      ---check for Tree-sitter support and set syntax highlighting accordingly.
      local has_lang, lang = pcall(vim.treesitter.language.get_lang, ft)
      local has_ts, _ = pcall(vim.treesitter.start, self.buf, has_lang and lang or ft)
      if not has_ts then
        vim.bo[self.buf].syntax = ft
        vim.bo[self.buf].filetype = ft
      end
    end)
  )

  ---execute the post-open hook, and if it returns false, close the preview.
  if not self.config.hooks.post_open(self.buf) then self:close "post open" end
end

---@private
---
---Opens a float window to preview the file under the cursor in the nvim-tree window.
---
---This function checks the file type and opens a preview for the file if it is a regular file.
function M:preview_under_cursor()
  ---attempt to get the node under the cursor from nvim-tree.
  local _, node = pcall(require("nvim-tree.api").tree.get_node_under_cursor)
  if not node then return end

  ---close the preview if the node represents the current file.
  if node.absolute_path == self.path then return end

  ---close the current preview and open a new one if the node represents a regular file.
  self:close "change file"
  if node.type ~= "file" then return end

  ---don't invert order! otherwise cursor is put is the preview window
  local win = vim.api.nvim_get_current_win()
  self:preview(node.absolute_path)

  ---restore focus to the original window.
  local ok, _ = pcall(vim.api.nvim_set_current_win, win)
  if not ok then self:close "can't set win" end
end

---@private
---
---Scrolls the preview window to the specified line.
---
---@param line number The line number to scroll to.
function M:scroll(line)
  if self.win then
    local ok, _ = pcall(vim.api.nvim_win_set_cursor, self.win, { line, 0 })
    if ok then self.current_line = line end
  end
end

---@private
---
---Scrolls the preview window down by a configured number of lines.
---@see FloatPreview.scroll
function M:scroll_down()
  if self.buf then
    local next_line =
      math.min(self.current_line + self.config.scroll_lines, self.max_line)
    self:scroll(next_line)
  end
end

---@private
---
--- Scrolls the preview window up by a configured number of lines.
---@see FloatPreview.scroll
function M:scroll_up()
  if self.buf then
    local next_line = math.max(self.current_line - self.config.scroll_lines, 1)
    self:scroll(next_line)
  end
end

---@private
---
---Attaches key mappings and autocmds for the preview window to a specified buffer.
---
---This function sets up key mappings for scrolling and toggling the preview window
---and creates autocmds to handle cursor hold events and buffer wipeout events.
---
---@param bufnr number The buffer number to attach the mappings and autocmds to.
function M:attach(bufnr)
  ---set up key mappings for scrolling and toggling the preview window.
  for _, key in ipairs(self.config.mapping.up) do
    vim.keymap.set("n", key, function() self:scroll_up() end, { buffer = bufnr })
  end

  for _, key in ipairs(self.config.mapping.down) do
    vim.keymap.set("n", key, function() self:scroll_down() end, { buffer = bufnr })
  end

  for _, key in ipairs(self.config.mapping.toggle) do
    vim.keymap.set("n", key, function() M:toggle() end, { buffer = bufnr })
  end

  ---create autocmds to handle cursor hold events and buffer wipeout events.
  local au = {}
  table.insert(
    au,
    vim.api.nvim_create_autocmd({ "CursorHold" }, {
      group = augroup,
      callback = function()
        if bufnr == vim.api.nvim_get_current_buf() then
          self:preview_under_cursor()
        else
          self:close "changed buffer"
        end
      end,
    })
  )

  vim.api.nvim_create_autocmd({ "BufWipeout" }, {
    buffer = bufnr,
    group = augroup,
    callback = function()
      self:close "wipe"
      M.floats[bufnr] = nil

      ---remove autocmds associated with the closed buffer.
      for _, au_id in pairs(au) do
        vim.api.nvim_del_autocmd(au_id)
      end

      self = nil
    end,
  })

  M.floats[bufnr] = self
end

---Attaches a FloatPreview instance to a buffer and returns the attached instance.
---
---After attaching to the buffer, it will subscribe to some `nvim-tree` events to
---automatically close the floating window.
---example usage:
---
---```lua
---require("nvim-tree").setup({
---  on_attach = function (bufnr)
---    require("srv.utils.nvim-tree.float-preview").on_attach(bufnr)
---
---    ---set mappings, etc
---    require("nvim-tree.api").mappings.default_on_attach(bufnr)
---  end
---})
---```
---
---@param bufnr number The buffer number to attach the FloatPreview instance to.
---@return FloatPreview FloatPreview The attached FloatPreview instance.
M.on_attach = function(bufnr)
  ---@class FloatPreview
  local FloatPreview = M:new()
  FloatPreview:attach(bufnr)

  local Event = api.events.Event
  local close_float_on_events = {
    Event.TreeClose,
    Event.WillCreateFile,
    Event.FileCreated,
    Event.FolderCreated,
    Event.WillRemoveFile,
    Event.FileRemoved,
    Event.FolderRemoved,
    Event.WillRenameNode,
    Event.NodeRenamed,
  }

  for _, event in ipairs(close_float_on_events) do
    api.events.subscribe(event, function()
      vim.schedule(function() utils.window.close_all(M.floats) end)
    end)
  end

  return FloatPreview
end

return M
