---User defined functions
---@module "functions"
---@author sRavioli
---@license GPL-3.0

local M = {}

---Aligns a markdown table in insert mode
M.align_table = function()
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

    -- `l` means left aligned and `1` means one space of cell padding
    vim.cmd "Tabularize/|/l1"
    vim.cmd "normal! 0"
    vim.fn.search(("[^|]*|"):rep(col) .. ("\\s\\{-\\}"):rep(pos), "ce", linenr)
  end
end

M.load_mappings = function(section, mapping_opt)
  vim.schedule(function()
    local tbl_merge = vim.tbl_deep_extend

    local function set_section_map(section_values)
      if section_values.plugin then
        return
      end

      section_values.plugin = nil

      for mode, mode_values in pairs(section_values) do
        local default_opts = tbl_merge("force", { mode = mode }, mapping_opt or {})
        for keybind, mapping_info in pairs(mode_values) do
          -- merge default + user opts
          local opts = tbl_merge("force", default_opts, mapping_info.opts or {})

          mapping_info.opts, opts.mode = nil, nil
          opts.desc = mapping_info[2]

          vim.keymap.set(mode, keybind, mapping_info[1], opts)
        end
      end
    end

    local mappings = require "mappings"

    if type(section) == "string" then
      mappings[section]["plugin"] = nil
      mappings = { mappings[section] }
    end

    for _, sect in pairs(mappings) do
      set_section_map(sect)
    end
  end)
end

---Filters diagnostigs leaving only the most severe per line.
---@param diagnostics table[]
---@return table[]
---@see https://www.reddit.com/r/neovim/comments/mvhfw7/can_built_in_lsp_diagnostics_be_limited_to_show_a/gvd8rb9/
---@see https://github.com/neovim/neovim/issues/15770
---@see https://github.com/akinsho/dotfiles/blob/d3526289627b72e4b6a3ddcbfe0411b5217a4a88/.config/nvim/plugin/lsp.lua#L83-L132
---@see `:h diagnostic-handlers`
M.filter_diagnostics = function(diagnostics)
  if not diagnostics then
    return {}
  end

  -- find the "worst" diagnostic per line
  local most_severe = {}
  for _, cur in pairs(diagnostics) do
    local max = most_severe[cur.lnum]

    -- higher severity has lower value (`:h diagnostic-severity`)
    if not max or cur.severity < max.severity then
      most_severe[cur.lnum] = cur
    end
  end

  -- return list of diagnostics
  return vim.tbl_values(most_severe)
end

M.async_formatting = function(bufnr)
  bufnr = bufnr or vim.api.nvim_get_current_buf()

  vim.lsp.buf_request(
    bufnr,
    "textDocument/formatting",
    vim.lsp.util.make_formatting_params {},
    function(err, res, ctx)
      if err then
        local err_msg = type(err) == "string" and err or err.message
        -- you can modify the log message / level (or ignore it completely)
        vim.notify("formatting: " .. err_msg, vim.log.levels.WARN)
        return
      end

      -- don't apply results if buffer is unloaded or has been modified
      if
        not vim.api.nvim_buf_is_loaded(bufnr)
        or vim.api.nvim_buf_get_option(bufnr, "modified")
      then
        return
      end

      if res then
        local client = vim.lsp.get_client_by_id(ctx.client_id)
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

---Detects the current OS
---@return string OS_name The OS name (lnx | win)
M.get_os = function()
  if vim.loop.os_uname().sysname == "Linux" then
    return "lnx"
  else
    return "win"
  end
end

M.null_ls_autoformat = function(client, bufnr)
  local lsp_formatting = require("utils.augroups").null_ls
  if client.supports_method "textDocument/formatting" then
    vim.api.nvim_clear_autocmds { group = lsp_formatting, buffer = bufnr }
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = lsp_formatting,
      buffer = bufnr,
      callback = function()
        -- SYNC FORMATTING
        vim.lsp.buf.format { bufnr = bufnr }

        -- ASYNC FORMATTING
        -- Caveats!
        -- Async formatting works by sending a formatting request, then applying
        -- and writing results once they're received. This lets you move the
        -- cursor, scroll, and otherwise interact with the window while waiting
        -- for results, which can make formatting seem more responsive (but
        -- doesn't actually speed it up).
        -- The async formatting implementation here comes with the following caveats:
        -- * If you edit the buffer in between sending a request and receiving
        --   results, those results won't be applied.
        -- * Each save will result in writing the file to the disk twice.
        -- * `:wq` will not format the file before quitting.
        -- M.async_formatting(bufnr) -- uncomment to enable async formatting
      end,
    })
  end
end

return M
