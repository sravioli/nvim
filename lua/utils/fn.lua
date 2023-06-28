---@module "functions"
---@author sRavioli
---@license GPL-3.0
---@version 1.0.0

local fn = {
  ---@type function Align a markdown table using `:Tabularize`
  align_table = function()
    local pattern = "^%s*|%s.*%s|%s*$"
    local linenr, colnr = vim.fn.line ".", vim.fn.col "."
    local curr_line = vim.fn.getline "."
    local prev_line, next_line =
      vim.fn.getline(linenr - 1), vim.fn.getline(linenr + 1)

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
  end,

  load_mappings = function(section, mapping_opt)
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
  end,
}

return fn
