---last updated: 2023-12-03 19:00
---@class Fun
local M = {}

-- {{{1 Fun.general

---Wrapper for `:h has()`
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
---@param s string input string
---@param pat? string pattern to use to strip chars. default: `"[%p%c%s]"`
---@param repl? string replacement string. default: `""`
---@return string str copy of `s` without chars from pattern
---@return integer count?
M.strip = function(s, pat, repl)
  return s:gsub(pat or "[%p%c%s]", repl or "")
end

---Retrieves some of the system information
---@return string sysname name of the system
---@return string machine machine architecture
M.os_info = function()
  return uv.os_uname().sysname:lower(), uv.os_uname().machine:lower()
end
-- }}}

-- {{{1 Fun.providers

---Functions to handle vim host programs
M.providers = {}

---The table of vim providers
---@return table providers
M.providers.get = function()
  return {
    node = {
      windows_nt = {
        x86_64 = (os.getenv "APPDATA" or "") .. "/npm/node_modules/neovim/bin/cli.js",
      },
      linux = { x86_64 = "/home/linuxbrew/.linuxbrew/bin/neovim-node-host", aarch64 = 0 },
    },

    ruby = {
      windows_nt = { x86_64 = "C:/tools/ruby31/bin/ruby.exe" },
      linux = { x86_64 = "/home/linuxbrew/.linuxbrew/bin/ruby", aarch64 = 0 },
    },

    perl = {
      windows_nt = { x86_64 = "C:/Strawberry/perl/bin/perl.exe" },
      linux = { x86_64 = "/home/linuxbrew/.linuxbrew/bin/perl", aarch64 = 0 },
    },

    python3 = {
      windows_nt = {
        x86_64 = (os.getenv "USERPROFILE" or "") .. "/.py-nvim/Scripts/python.exe",
      },
      linux = { x86_64 = "/home/sravioli/.py-nvim/bin/python3", aarch64 = 0 },
    },
  }
end

---Sets the values of all the vim host programs. No path found == disable.
M.providers.enable = function()
  local providers = M.providers.get()
  for provider, paths in pairs(providers) do
    vim.g[provider .. "_host_prog"] = nil
    local sysname, machine = M.os_info()

    local path = paths[sysname][machine]
    vim.g[provider .. "_host_prog"] = path ~= 0 and vim.fs.normalize(path) or path
  end
end

---Disables all vim host programs
M.providers.disable = function()
  for provider, _ in pairs(M.providers.get()) do
    vim.g["loaded_" .. provider .. "_provider"] = 0
  end
end
-- }}}

-- {{{1 Fun.telescope

---Utility functions for telescope.nvim
M.telescope = {}

---Finds files in current directory with `git_files` or fallbacks to `find_files`
M.telescope.fd = function()
  vim.fn.system "git rev-parse --is-inside-work-tree"
  if vim.v.shell_error == 0 then
    vim.fn.system "git diff-index --quiet HEAD"
    if vim.v.shell_error == 0 then
      require("telescope.builtin").git_files {}
    end
  end
  require("telescope.builtin").find_files {}
end

---Previews an image using `Chafa`
---@param filepath string the path of the file to preview
---@param bufnr number the buffer number
---@param opts table options
M.telescope.preview_img = function(filepath, bufnr, opts)
  local is_image = function(path)
    local image_extensions = { "png", "jpg", "gif" } ---Supported image formats
    local split_path = vim.split(path:lower(), ".", { plain = true })
    local extension = split_path[#split_path]
    return vim.tbl_contains(image_extensions, extension)
  end

  if is_image(filepath) then
    local term = vim.api.nvim_open_term(bufnr, {})
    local function send_output(_, data, _)
      for _, d in ipairs(data) do
        vim.api.nvim_chan_send(term, d .. "\r\n")
      end
    end
    vim.fn.jobstart({ "chafa", filepath }, {
      on_stdout = send_output,
      stdout_buffered = true,
      pty = true,
    })
  else
    require("telescope.previewers.utils").set_preview_message(
      bufnr,
      opts.winid,
      "Binary cannot be previewed"
    )
  end
end
-- }}}

-- {{{1 Fun.lsp

---Functions for lsp related stuff
M.lsp = {}

---Retrieves the diagnostic icon based on the given severity
---@param severity integer the `:h vim.diagnostic.severity` level
---@return string|nil sign icon corresponding to the severity level. `nil` if not found.
---@return string|nil hl highlight for the icon. `nil` if not found
M.lsp.get_icon = function(severity)
  local signs = require("srv.preferences").icons.diagnostics
  for type, sign in pairs(signs) do
    if severity == vim.diagnostic.severity[type:upper()] then
      return sign, "DiagnosticSign" .. type
    end
  end
  return nil, nil
end

---Formats the diagnostic message from the LSP or other source.
---@param diagnostic table the `:h diagnostic-structure` table from the LSP.
---@return string fmt the formatted LSP diagnostics message
M.lsp.format_message = function(diagnostic)
  local fmt = ""

  local msg = diagnostic.message
  if diagnostic.source then
    msg = msg:gsub("%(" .. diagnostic.source .. "%)", "")
    local source =
      diagnostic.source:gsub("^[%p%s]*(.-)[%p%s]*$", "%1"):gsub("[%s]", "-"):lower()
    fmt = fmt .. ("%s:"):format(source)
  end

  if diagnostic.code then
    msg = msg:gsub("%[" .. diagnostic.code .. "%]", "")
    fmt = fmt .. (" [%s]"):format(diagnostic.code)
  end

  fmt = fmt .. (" %s"):format(msg)

  return fmt
end
-- }}}

-- {{{1 Fun.fmt

M.fmt = {}

---Updates the "last updated/changed/modified" timestamp of a file
M.fmt.update_timestamp = function()
  if not vim.api.nvim_buf_get_option(0, "modifiable") then
    return
  end

  local MAX_LINES = 30
  local buflines = vim.api.nvim_buf_line_count(0)
  local re =
    vim.regex [[\(Last\)\?\s*\([Cc]hanged\?\|[Mm]odified\|[Uu]pdated\?\)\s*:\s*\zs.*]]
  if not re then
    vim.notify("[timestamp]: unable to create regex", vim.diagnostic.severity.ERROR)
    return
  end

  for linenr = 1, (buflines < MAX_LINES and buflines or MAX_LINES) do
    local line = vim.fn.getline(linenr)
    if type(line) == "table" then
      line = select(1, unpack(line))
    end

    local colnr = re:match_str(line)
    if colnr then
      vim.fn.setline(linenr, line:sub(1, colnr) .. os.date "%Y-%m-%d %H:%M")
    end
  end
end

M.fmt.markdown_table = function() end
-- }}}

return M
