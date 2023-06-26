--- @param trunc_width number trunctates component when screen width is less then trunc_width
--- @param trunc_len number truncates component to trunc_len number of chars
--- @param hide_width number hides component when window width is smaller then hide_width
--- @param no_ellipsis boolean whether to disable adding '...' at end after truncation
--- return function that can format the component accordingly
local function trunc(trunc_width, trunc_len, hide_width, no_ellipsis)
  return function(str)
    local win_width = vim.fn.winwidth(0)
    if hide_width and win_width < hide_width then
      return ""
    elseif
      trunc_width
      and trunc_len
      and win_width < trunc_width
      and #str > trunc_len
    then
      return str:sub(1, trunc_len) .. (no_ellipsis and "" or "...")
    end
    return str
  end
end

-- local added = (git_status.added and git_status.added ~= 0) and ("  " .. git_status.added) or ""
-- local changed = (git_status.changed and git_status.changed ~= 0) and ("  " .. git_status.changed) or ""
-- local removed = (git_status.removed and git_status.removed ~= 0) and ("  " .. git_status.removed) or ""
-- local branch_name = "  " .. git_status.head

local opts = {
  options = {
    icons_enabled = true,
    theme = "auto",
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = true,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    },
  },
  sections = {
    lualine_a = {
      { "mode", fmt = trunc(80, 4, 0, true) },
    },
    lualine_b = {
      {
        "buffers",
        filetype_names = { lazy = "Lazy", mason = "Mason" },
        fmt = trunc(90, 30, 50, false),
      },
    },
    lualine_c = {
      { "branch", icon = "  " },
      { "diff" },
      { "diagnostics" },
    },
    lualine_x = {
      { "encoding" },
      {
        "fileformat",
        icons_enabled = true,
        symbols = {
          unix = "LF",
          dos = "CRLF",
          mac = "CR",
        },
      },
      { "filetype" },
    },
    lualine_y = {
      { "progress" },
    },
    lualine_z = {
      { "location" },
    },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { "filename" },
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {},
}

return opts
