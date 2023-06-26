---@param trunc_width number trunctates component when screen width is less then `trunc_width`
---@param trunc_len number truncates component to trunc_len number of chars
---@param hide_width number hides component when window width is smaller then `hide_width`
---@param no_ellipsis boolean whether to disable adding '...' at end after truncation
---@return function function function that can format the component accordingly
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

local function diff_source()
  local gitsigns = vim.b.gitsigns_status_dict
  if gitsigns then
    return {
      added = gitsigns.added,
      modified = gitsigns.changed,
      removed = gitsigns.removed,
    }
  end
  return nil
end

local opts = {
  options = {
    icons_enabled = true,
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
        "filetype",
        icon_only = true,
        separator = "",
        padding = {
          left = 1,
          right = 0,
        },
      },
      { "filename" },
    },
    lualine_c = {
      { "branch", icon = "  ", color = "Comment" },
      {
        "diff",
        symbols = { added = "  ", modified = "  ", removed = "  " },
        -- source = diff_source,
      },
      {
        "diagnostics",
        sources = { "nvim_lsp", "nvim_diagnostic" },
        symbols = { error = "  ", warn = "  ", info = "  ", hint = "  " },
      },
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
  extensions = {
    "lazy",
    "neo-tree",
    "trouble",
    "man",
    "fzf",
    "quickfix",
    "toggleterm",
  },
}

return opts
