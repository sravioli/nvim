---User defined functions
---@module "functions"
---@author sRavioli
---@license GPL-3.0

---User defined utility functions
---@class Functions
---@field mappings table Functions related to keymaps
---@field telescope table Functions related to the telescope plugin
---@field lsp table Functions related to the Language Server Protocol
---@field snippets table Functions related to LuaSnip
local Functions = { mappings = {}, telescope = {}, lsp = {}, snippets = {} }

---Aligns a markdown table in insert mode
---@return nil
Functions.align_table = function()
  local pattern = "^%s*|%s.*%s|%s*$"
  local linenr, colnr = vim.fn.line ".", vim.fn.col "."
  local curr_line = vim.fn.getline "."
  local prev_line, next_line = vim.fn.getline(linenr - 1), vim.fn.getline(linenr + 1)

  if
    vim.fn.exists ":Tabularize"
    and curr_line:match "^%s*|"
    and (prev_line:match(pattern) or next_line:match(pattern))
  then
    local col = #curr_line:sub(1, colnr):gsub("[^|]", "")
    local pos = #vim.fn.matchstr(curr_line:sub(1, colnr), ".*|\\s*\\zs.*")

    ---`l` means left aligned and `1` means one space of cell padding
    vim.cmd "Tabularize/|/l1"
    vim.cmd "normal! 0"
    vim.fn.search(("[^|]*|"):rep(col) .. ("\\s\\{-\\}"):rep(pos), "ce", linenr)
  end
end

---Detects the current OS
---@return string OS The OS name that can be lnx|win
Functions.get_os = function()
  if vim.loop.os_uname().sysname == "Linux" then
    return "lnx"
  else
    return "win"
  end
end

---Updates the last changed/modified/etc timestamp of a file
Functions.update_timestamp = function()
  -- file not modifiable
  local bufnr = vim.api.nvim_get_current_buf()
  if not vim.api.nvim_buf_get_option(bufnr, "modifiable") then
    return
  end

  local MAX_LINES = 30
  local buflines = vim.api.nvim_buf_line_count(bufnr)

  for line = 1, (buflines < MAX_LINES and buflines or MAX_LINES) do
    vim.fn.setline(
      line,
      vim.fn.substitute(
        vim.fn.getline(line),
        [[\(Last\)\?\s*\([Cc]hanged\?\|[Mm]odified\|[Uu]pdated\?\)\s*:\s*\zs.*]],
        os.date "%Y-%m-%d %H:%M", -- format: YYYY-MM-DD HH:mm
        "gc"
      )
    )
  end
end

local typewriter_state = false
---Toggles typewriter scroll. Has to be called in each buffer.
---@return nil
Functions.typewriter_toggle = function()
  if typewriter_state then
    vim.opt_local.scrolloff = 0
  else
    vim.opt_local.scrolloff =
      math.floor(vim.api.nvim_win_get_height(vim.api.nvim_get_current_win()) / 2)
  end
  typewriter_state = not typewriter_state -- toggle the state
  require "notify"(
    (typewriter_state and "En" or "Dis") .. "abled typewriter scrolling",
    "info"
  )
end

---Filters diagnostigs leaving only the most severe per line.
---@param diagnostics table[]
---@return table[]
---@see https://www.reddit.com/r/neovim/comments/mvhfw7/can_built_in_lsp_diagnostics_be_limited_to_show_a/gvd8rb9/
---@see https://github.com/neovim/neovim/issues/15770
---@see https://github.com/akinsho/dotfiles/blob/d3526289627b72e4b6a3ddcbfe0411b5217a4a88/.config/nvim/plugin/lsp.lua#L83-L132
---@see `:h diagnostic-handlers`
Functions.lsp.filter_diagnostics = function(diagnostics)
  if not diagnostics then
    return {}
  end

  ---find the "worst" diagnostic per line
  local most_severe = {}
  for _, cur in pairs(diagnostics) do
    local max = most_severe[cur.lnum]

    ---higher severity has lower value (`:h diagnostic-severity`)
    if not max or cur.severity < max.severity then
      most_severe[cur.lnum] = cur
    end
  end

  ---return list of diagnostics
  return vim.tbl_values(most_severe)
end

Functions.lsp.async_formatting = function(client, bufnr)
  vim.lsp.buf_request(
    bufnr,
    "textDocument/formatting",
    vim.lsp.util.make_formatting_params {},
    function(err, res, _)
      if err then
        local err_msg = type(err) == "string" and err or err.message
        ---you can modify the log message / level (or ignore it completely)
        vim.notify("formatting: " .. err_msg, vim.log.levels.WARN)
        return
      end

      ---don't apply results if buffer is unloaded or has been modified
      if
        not vim.api.nvim_buf_is_loaded(bufnr)
        or vim.api.nvim_buf_get_option(bufnr, "modified")
      then
        return
      end

      if res then
        vim.lsp.util.apply_text_edits(
          res,
          bufnr,
          client and client.offset_encoding or "utf-16"
        )
        vim.api.nvim_buf_call(bufnr, function()
          vim.cmd "silent noautocmd update"
        end)
      end
    end
  )
end

Functions.lsp.autoformat = function(client, bufnr)
  local lsp_formatting = vim.api.nvim_create_augroup("NullLsGroup", {})
  if client.supports_method "textDocument/formatting" then
    vim.api.nvim_clear_autocmds { group = lsp_formatting, buffer = bufnr }
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = lsp_formatting,
      buffer = bufnr,
      callback = function()
        ---SYNC FORMATTING
        vim.lsp.buf.format { bufnr = bufnr }

        ---ASYNC FORMATTING
        ---Caveats!
        ---Async formatting works by sending a formatting request, then applying
        ---and writing results once they're received. This lets you move the
        ---cursor, scroll, and otherwise interact with the window while waiting
        ---for results, which can make formatting seem more responsive (but
        ---doesn't actually speed it up).
        ---The async formatting implementation here comes with the following caveats:
        ---* If you edit the buffer in between sending a request and receiving
        ---  results, those results won't be applied.
        ---* Each save will result in writing the file to the disk twice.
        ---* `:wq` will not format the file before quitting.
        ---Functions.lsp.async_formatting(bufnr) ---uncomment to enable async formatting
      end,
    })
  end
end

Functions.telescope.fd = function()
  vim.fn.system "git rev-parse --is-inside-work-tree"
  if vim.v.shell_error == 0 then
    require("telescope.builtin").git_files {}
  else
    require("telescope.builtin").find_files {}
  end
end

Functions.telescope.preview_img = function(filepath, bufnr, opts)
  ---@diagnostic disable-next-line: redefined-local
  local is_image = function(filepath)
    local image_extensions = { "png", "jpg", "gif" } ---Supported image formats
    local split_path = vim.split(filepath:lower(), ".", { plain = true })
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

Functions.telescope.buffer_previewer = function(filepath, bufnr, opts)
  local previewers = require "telescope.previewers"
  local Job = require "plenary.job"
  filepath = vim.fn.expand(filepath)
  Job:new({
    command = "file",
    args = { "--mime-type", "-b", filepath },
    on_exit = function(j)
      local mime_type = vim.split(j:result()[1], "/")[1]
      if mime_type == "text" then
        previewers.buffer_previewer_maker(filepath, bufnr, opts)
      else
        ---maybe we want to write something to the buffer here
        vim.schedule(function()
          vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { "BINARY" })
        end)
      end
    end,
  }):sync()
end

---Condense the LuaSnip snippet context for snippets
---@param trig string The sequence that triggers the snippet.
---@param name string Can be used by e.g. nvim-compe to identify the snippet.
---@param desc string|table The description. Can be multiline (either with `\n` or table).
---@param snippetType? string Determines if this snippet has to be triggered manually (`"snippet"`) or automatically (`"autosnippet"`).
---@param trigEngine? string|function How `trig` is interpreted. Defaults to `"plain"` and supports: `"pattern"`, `ecma"`, `"vim"` or a custom function.
---@param wordTrig? boolean Whether to expand the snippet if the word (`[%w_]+`) matches `trig` entirely. `True` by default.
---@param priority? number The priority of the snippet. `1000` by default. Snippets with high priority will be matched to a trigger before those with a lower one
---@return table context The assembled LuaSnip context
Functions.snippets.snip = function(
  trig,
  name,
  desc,
  snippetType,
  wordTrig,
  trigEngine,
  priority
)
  return {
    trig = trig,
    name = name,
    desc = desc,
    snippetType = snippetType and snippetType or "snippet",
    trigEngine = trigEngine and trigEngine or "plain",
    wordTrig = wordTrig and true,
    priority = priority or 1000,
  }
end

function Functions.lazy_notify()
  local notifs = {}
  local function temp(...)
    table.insert(notifs, vim.F.pack_len(...))
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
  -- or if it took more than 500ms, then something went wrong
  timer:start(500, 0, replay)
end

return Functions
