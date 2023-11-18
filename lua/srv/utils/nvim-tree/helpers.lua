---@class NvimTreeExtensionsHelpers
local M = {}

---@class NvimTreeExtensionsHelpers.Log
M.log = {
  ---Logs an error message.
  ---
  ---@param msg string The error message.
  ---@param ... any Additional values to be formatted into the message.
  err = function(msg, ...)
    vim.notify((msg):format(...), vim.log.levels.ERROR)
  end,

  ---Logs a warning message.
  ---
  ---@param msg string The warning message.
  ---@param ... any Additional values to be formatted into the message.
  warn = function(msg, ...)
    vim.notify((msg):format(...), vim.log.levels.WARN)
  end,

  ---Logs an informational message.
  ---
  ---@param msg string The informational message.
  ---@param ... any Additional values to be formatted into the message.
  info = function(msg, ...)
    vim.notify((msg):format(...), vim.log.levels.INFO)
  end,

  ---Logs a debug message.
  ---
  ---@param msg string The debug message.
  ---@param ... any Additional values to be formatted into the message.
  debug = function(msg, ...)
    vim.notify((msg):format(...), vim.log.levels.DEBUG)
  end,

  ---Logs a trace message.
  ---
  ---@param msg string The trace message.
  ---@param ... any Additional values to be formatted into the message.
  trace = function(msg, ...)
    vim.notify((msg):format(...), vim.log.levels.TRACE)
  end,
}

---@class NvimTreeExtensionsHelpers.FileSystem
M.fs = {
  ---Gets the size of a file in megabytes.
  ---
  ---@param file_path string The path to the file.
  ---@return number|nil size The file size in megabytes, or nil if there was an error.
  get_file_size = function(file_path)
    local success, file_stats = pcall(function()
      return vim.loop.fs_stat(file_path)
    end)
    if not (success and file_stats) then
      return
    end

    return math.floor(0.5 + (file_stats.size / (1024 * 1024)))
  end,

  ---Determines if a file is likely to be a text file.
  ---
  ---This method is not 100% proof but is good enough for common use cases.
  ---Source: <https://github.com/sharkdp/content_inspector>
  ---
  ---@param file_path string The path to the file.
  ---@return boolean|nil is_file True if file is text, false otherwise and nil for error
  is_text_file = function(file_path)
    local file_descriptor = vim.loop.fs_open(file_path, "r", 1)
    if not file_descriptor then
      M.log.err("Could not open file '%s' for reading", file_path)
      return
    end

    local is_text = not vim.loop.fs_read(file_descriptor, 1024):find "\0"
    vim.loop.fs_close(file_descriptor)
    return is_text
  end,

  ---Asynchronously reads the contents of a file and invokes a callback with the data.
  ---
  ---@param filepath string The path of the file to read.
  ---@param callback fun(data: string) The callback function to be invoked with the file data.
  read_file_async = function(filepath, callback)
    vim.loop.fs_open(filepath, "r", 438, function(err_open, fd)
      if err_open or not fd then
        -- Schedule to avoid E5560 error: nvim_exec must not be called in a lua loop callback
        vim.schedule(function()
          M.log.warn("Unable to open file '%s', error: %s", filepath, err_open)
        end)
        return
      end

      vim.loop.fs_fstat(fd, function(err_fstat, stat)
        if not stat then
          return
        end
        assert(not err_fstat, err_fstat)
        if stat.type ~= "file" then
          return callback ""
        end

        vim.loop.fs_read(fd, stat.size, 0, function(err_read, data)
          assert(not err_read, err_read)

          vim.loop.fs_close(fd, function(err_close)
            assert(not err_close, err_close)
            return callback(data or "")
          end)
        end)
      end)
    end)
  end,
}

---Detaches LSP clients from a buffer.
---
---Currently not working as expected.
---
---@param bufnr number The buffer number. If not provided, the current buffer is used.
M.detach_lsp_clients = function(bufnr)
  bufnr = bufnr or vim.api.nvim_get_current_buf()
  local active_clients = vim.lsp.get_active_clients { bufnr = bufnr }

  -- Temporarily disable notifications from buf_detach_client
  local lvl = vim.lsp.get_level()
  vim.lsp.set_log_level(vim.log.levels.OFF)
  for client_id, _ in pairs(active_clients) do
    vim.lsp.buf_detach_client(bufnr, client_id)
  end
  vim.lsp.set_log_level(lvl)
end

---@class FloatPreview.helpers.Window
M.window = {
  ---Checks if a window is currently displaying a file with the given path.
  ---
  ---@param file_path string: The path of the file to check.
  ---@return boolean is_shown True if file is currently shown in any window, false otherwise.
  is_shown = function(file_path)
    for _, window_number in
      ipairs(vim.api.nvim_tabpage_list_wins(vim.api.nvim_get_current_tabpage()))
    do
      local buffer = vim.api.nvim_win_get_buf(window_number)
      local current_path = vim.api.nvim_buf_get_name(buffer)
      if current_path == file_path then
        return true
      end
    end
    return false
  end,

  ---Opens previews for all active floats.
  open_all = function(floats)
    for _, float in pairs(floats) do
      float:preview_under_cursor()
    end
  end,

  ---Closes all active floats.
  close_all = function(floats)
    if #floats == 0 then
      M.log.trace "no windows to close"
      return
    end

    for _, float in pairs(floats) do
      float:close()
    end
  end,
}

return M
