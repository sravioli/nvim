local theme = require("kanagawa.colors").setup().theme
local conditions, heirline = require "heirline.conditions", require "heirline.utils"
local icons = require("srv.preferences").icons

-- {{{1 colors

local function setup_colors()
  return {
    fg = heirline.get_highlight("Normal").fg,
    fg_dim = heirline.get_highlight("NormalDark").fg,
    fg_reverse = heirline.get_highlight("IncSearch").fg,

    bg = heirline.get_highlight("Normal").bg,
    bg_dark = heirline.get_highlight("NormalDark").bg,
    bg_darker = theme.ui.bg_dim,
    bg_darkest = heirline.get_highlight("StatusLine").bg,
    bg_light = heirline.get_highlight("ColorColumn").bg,
    bg_lighter = heirline.get_highlight("ColorColumn").bg,

    red = heirline.get_highlight("PreProc").fg,
    green = heirline.get_highlight("String").fg,
    yellow = heirline.get_highlight("Operator").fg,
    orange = heirline.get_highlight("Constant").fg,
    blue = heirline.get_highlight("Function").fg,
    magenta = heirline.get_highlight("Statement").fg,
    cyan = heirline.get_highlight("Type").fg,
    gray = heirline.get_highlight("Comment").fg,
    delimiter = heirline.get_highlight("Delimiter").fg,
    special = heirline.get_highlight("Folded").fg,
    parameter = heirline.get_highlight("@variable.parameter").fg,
    identifier = heirline.get_highlight("Identifier").fg,

    diag_ok = heirline.get_highlight("DiagnosticOk").fg,
    diag_warn = heirline.get_highlight("DiagnosticWarn").fg,
    diag_error = heirline.get_highlight("DiagnosticError").fg,
    diag_hint = heirline.get_highlight("DiagnosticHint").fg,
    diag_info = heirline.get_highlight("DiagnosticInfo").fg,

    git_del = heirline.get_highlight("diffDeleted").fg,
    git_add = heirline.get_highlight("diffAdded").fg,
    git_change = heirline.get_highlight("diffChanged").fg,
  }
end

require("heirline").load_colors(setup_colors)

vim.api.nvim_create_augroup("Heirline", { clear = true })
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    heirline.on_colorscheme(setup_colors)
  end,
  group = "Heirline",
})

-- }}}

-- {{{1 utils/helpers

---@class utils
local h = {}

---Strips whitespace, punctuation and control chars from string
---@param s string input string
---@param pat? string pattern to use to strip chars
---@return string str copy of `s` without chars from pattern
h.strip = function(s, pat)
  pat = pat or "[%p%c%s]"
  local ret = s:gsub(pat, "")
  return ret
end

---Returns a padded string and ensures that it's not shorter than 2 chars.
---@param s string input string
---@param padding? integer left/right padding. defaults to 1
---@return string s the padded string
h.pad = function(s, padding)
  s = type(s) ~= "string" and tostring(s) or s
  padding = padding or 1

  local pad = (" "):rep(padding)
  return ("%s%s%s"):format(pad, s, pad)
end

h.Separators = {
  hard_divider = { l = "", r = "" },
  soft_divider = { l = "", r = "" },
  triangle = { ll = "", lr = "", ul = "", ur = "" },
  circle_thick = { l = "", r = "" },
  circle_thin = { l = "", r = "" },
}
-- }}}

---@class Statusline
local M = {
  -- {{{1 Static variables
  static = {
    mode_colors_map = {
      n = "blue",
      i = "green",
      v = "magenta",
      V = "magenta",
      ["\22"] = "magenta",
      c = "yellow",
      s = "red",
      S = "red",
      ["\19"] = "red",
      R = "orange",
      r = "orange",
      ["!"] = "grey",
      t = "delimiter",
    },

    mode_bg = function(self)
      local mode = conditions.is_active() and vim.fn.mode() or "n"
      return self.mode_colors_map[mode]
    end,
    mode_fg = "bg_darker",
  },
  -- }}}

  ---use the first statusline whose condition returns true.
  fallthrough = false,
}

-- {{{1 BuildingBlocks

---@class StatuslineBuildingBlocks
local blocks = {}

--~ {{{2 Trivial/Useful BuildingBlocks

---Provides alignment
blocks.Align = { provider = "%=" }

---Adds single/n space(s)
blocks.Space = setmetatable({ provider = " " }, {
  __call = function(_, n)
    return { provider = string.rep(" ", n) }
  end,
})

---Break a block from another
blocks.Break = { blocks.Space, blocks.Align, blocks.Space }
--~ }}}

--~ {{{2 ViMode

---Displays the current vi mode
blocks.ViMode = {
  init = function(self)
    self.mode = vim.fn.mode(1)

    if not rawget(self, "once") then
      vim.api.nvim_create_autocmd({ "ModeChanged", "VimResized", "WinResized" }, {
        callback = vim.schedule_wrap(function()
          vim.cmd "redrawstatus"
        end),
      })
      self.once = true
    end
  end,

  static = {
    mode_names = {
      n = "NORMAL",
      no = "O-PENDING",
      nov = "O-PENDING (LINE)",
      noV = "O-PENDING (BLOCK)",
      ["no\22"] = "O-PENDING",
      niI = "NORMAL (INSERT)",
      niR = "NORMAL (REPLACE)",
      niV = "NORMAL (V-REPLACE)",
      nt = "NORMAL (TERMINAL)",
      v = "VISUAL",
      vs = "VISUAL (SELECT)",
      V = "V-LINE",
      Vs = "V-LINE (SELECT)",
      ["\22"] = "V-BLOCK",
      ["\22s"] = "V-BLOCK (SELECT)",
      s = "SELECT",
      S = "S-LINE",
      ["\19"] = "S-BLOCK",
      i = "INSERT",
      ic = "INSERT (COMPLETION)",
      ix = "INSERT (COMPLETION)",
      R = "REPLACE",
      Rc = "REPLACE (COMPLETION)",
      Rx = "REPLACE (COMPLETION)",
      Rv = "V-REPLACE",
      Rvc = "V-REPLACE (COMPLETION)",
      Rvx = "V-REPLACE (COMPLETION)",
      c = "COMMAND",
      cv = "EXECUTE",
      r = "...",
      rm = "MORE",
      ["r?"] = "?",
      ["!"] = "!",
      t = "TERMINAL",
    },
  },

  hl = function(self)
    return { fg = self.mode_fg, bg = self:mode_bg(), bold = true }
  end,

  {
    flexible = 1,
    { ---full length mode indicator
      provider = function(self)
        return h.pad(self.mode_names[self.mode])
      end,
    },
    { ---truncated mode indicator
      provider = function(self)
        local mode = self.mode_names[self.mode]

        local a, b = unpack(vim.split(mode, "%s"))
        local a_left, a_right = unpack(vim.split(a, "%-")) ---split at dash
        a = a_left:sub(1, 1) .. (a_right == nil and "" or a_right:sub(1, 1):lower())

        ---basically the same thing done to `a`
        local b_left, b_right = unpack(vim.split(h.strip(b or "", "[%(%)]"), "%-"))
        b = (b_left == nil and "" or b_left:sub(1, 1))
          .. (b_right == nil and "" or b_right:sub(1, 1):lower())
        b = b == "" and b or (" (%s)"):format(b)

        return h.pad(a .. b)
      end,
    },
  },
}
--~ }}}

--~ {{{2 WorkingDir

---Displays the current working directory
blocks.WorkingDir = {
  init = function(self)
    self.icon = "  "
    self.cwd = vim.fn.fnamemodify(vim.fn.getcwd(0), ":~"):gsub("\\", "/")

    self.fg = heirline.get_highlight("Directory").fg
    self.bg = "bg_dark"
  end,

  hl = function(self)
    return { fg = self.fg, bg = self.bg, bold = true }
  end,

  {
    flexible = 1,
    { ---the full length path
      provider = function(self)
        return h.pad(self.icon .. self.cwd .. (self.cwd:sub(-1) == "/" and "" or "/"))
      end,
    },
    { ---shortened path
      provider = function(self)
        local cwd = vim.fn.pathshorten(self.cwd)
        local trail = self.cwd:sub(-1) == "/" and "" or "/"
        return h.pad(self.icon .. cwd .. trail)
      end,
    },
    { ---just the icon
      provider = function(self)
        return " " .. self.icon
      end,
    },
  },
}
--~ }}}

--~ {{{2 FilenameBlock

--~~ {{{3 FilenameBlock > Icon

blocks.FilenameIcon = {
  init = function(self)
    self.icon, self.icon_color = require("nvim-web-devicons").get_icon_color(
      self.filename,
      vim.fn.fnamemodify(self.filename, ":e"),
      { default = true }
    )
  end,
  provider = function(self)
    return self.icon and h.pad(self.icon)
  end,

  hl = function(self)
    return { fg = self.icon_color, bg = self.bg }
  end,
}
--~~ }}}

--~~ {{{3 FilenameBlock > Name

blocks.FilenameName = {
  init = function(self)
    self.lfilename = vim.fn.fnamemodify(self.filename, ":t")
    if self.lfilename == "" then
      self.lfilename = "[No Name]"
    end
  end,
  hl = function(self)
    return { fg = self.dir_fg, bg = self.bg }
  end,

  {
    flexible = 1,
    { ---full length name
      provider = function(self)
        return self.lfilename .. " "
      end,
    },
    { ---shortened filename
      provider = function(self)
        return vim.fn.pathshorten(self.lfilename) .. " "
      end,
    },
    { provider = "" }, ---hide the filename
  },
}
--~~ }}}

--~~ {{{3 FilenameBlock > Flags

blocks.FilenameFlags = {
  {
    condition = function()
      return vim.bo.modified
    end,
    provider = "[+] ",
    hl = function(self)
      return { fg = "git_add", bg = self.bg }
    end,
  },
  {
    condition = function()
      return not vim.bo.modifiable or vim.bo.readonly
    end,
    provider = " ",
    hl = function(self)
      return { fg = "diag_warn", bg = self.bg }
    end,
  },
}
--~~ }}}

blocks.FilenameBlock = heirline.insert({
  init = function(self)
    self.filename = vim.api.nvim_buf_get_name(0)
    self.dir_fg = heirline.get_highlight("Directory").fg
    self.bg = "bg_light"
  end,
}, heirline.insert(blocks.FilenameIcon, blocks.FilenameName, blocks.FilenameFlags))

--~ }}}

--~ {{{2 GitStatus

blocks.GitStatus = {
  condition = conditions.is_git_repo,

  init = function(self)
    self.status = vim.b.gitsigns_status_dict
    self.has_changes = self.status.added ~= 0
      or self.status.removed ~= 0
      or self.status.changed ~= 0
    self.added_sym, self.changed_sym, self.removed_sym = " +", " ~", " -"
  end,
  hl = function(self)
    self.git_fg = "special"
    return { fg = self.git_fg, bg = "bg_darker" }
  end,
  on_click = {
    callback = function()
      -- If you want to use Fugitive:
      -- vim.cmd("G")

      -- If you prefer Lazygit
      -- use vim.defer_fn() if the callback requires
      -- opening of a floating window
      -- (this also applies to telescope)
      vim.defer_fn(function()
        vim.cmd "Lazygit"
      end, 100)
    end,
    name = "heirline_git",
  },

  {
    { ---branch icon (static)
      hl = { bold = true },
      provider = " " .. h.strip(icons.git.Branch),
    },
    { ---branch name (flexible)
      flexible = 1,
      hl = { bold = true },
      { ---complete
        provider = function(self)
          return " " .. self.status.head
        end,
      },
      { provider = "" }, ---hide
    },
    { ---status (flexible)
      { ---added: <symbol><count> then <count> then <symbol>
        condition = function(self)
          self.added = self.status.added or 0
          return self.added > 0
        end,
        flexible = 1,
        hl = { fg = "git_add" },
        {
          provider = function(self)
            return self.added_sym .. self.added
          end,
        },
        {
          provider = function(self)
            return " " .. self.added
          end,
        },
        {
          provider = function(self)
            return self.added_sym
          end,
        },
      },
      { ---changed: <symbol><count> then <count> then <symbol>
        condition = function(self)
          self.changed = self.status.changed or 0
          return self.changed > 0
        end,
        flexible = 1,
        hl = { fg = "git_change" },
        {
          provider = function(self)
            return self.changed_sym .. self.changed
          end,
        },
        {
          provider = function(self)
            return " " .. self.changed
          end,
        },
        {
          provider = function(self)
            return self.changed_sym
          end,
        },
      },
      { ---removed: <symbol><count> then <count> then <symbol>
        condition = function(self)
          self.removed = self.status.removed or 0
          return self.removed > 0
        end,
        flexible = 1,
        hl = { fg = "git_del" },
        {
          provider = function(self)
            return self.removed_sym .. self.removed
          end,
        },
        {
          provider = function(self)
            return " " .. self.removed
          end,
        },
        {
          provider = function(self)
            return self.removed_sym
          end,
        },
      },
    },
  },
}
-- --~ }}}

--~ {{{2 FileinfoBlock

--~~ {{{3 FileType
blocks.FileType = {
  hl = { fg = "cyan", bg = "bg_light", bold = true },
  provider = function()
    local ft = vim.bo.filetype:upper()
    return ft == "" and " " or h.pad(ft)
  end,
}
--~~}}}

--~~ {{{3 FileFormat

blocks.FileFormat = {
  static = {
    map = {
      unix = { icon = "", fg = "#ffd246" },
      dos = { icon = "", fg = "#0078d4" },
      mac = { icon = "", fg = "#A3AAAE" },
    },
  },

  hl = function(self)
    return { fg = self.map[vim.bo.fileformat]["fg"], bg = "bg_light" }
  end,
  provider = function(self)
    return self.map[vim.bo.fileformat]["icon"]
  end,
}
--~~}}}

--~~ {{{3 FileEncoding

blocks.FileEncoding = {
  provider = function()
    return (vim.bo.fenc ~= "" and h.pad(vim.bo.fenc)) or h.pad(vim.o.enc) -- :h 'enc'
  end,
  hl = { fg = "fg_dim", bg = "bg_light" },
}
--~~}}}

--~~ {{{3 FileSize

blocks.FileSize = {
  hl = function(self)
    self.size_fg = "parameter"
    self.size_bg = "bg_lighter"
    return { fg = self.size_fg, bg = self.size_bg }
  end,

  {
    { ---filesize (flexible)
      flexible = 1,
      hl = function(self)
        return { fg = self.size_fg, bg = self.size_bg }
      end,
      { ---size or hide
        provider = function()
          -- stackoverflow, compute human readable file size
          local suffix = { "", "k", "M", "G", "T", "P", "E" }
          local fsize = vim.fn.getfsize(vim.api.nvim_buf_get_name(0))
          fsize = (fsize < 0 and 0) or fsize
          if fsize < 1024 then
            return (" %ib"):format(fsize)
          end
          local i = math.floor((math.log(fsize or 0) / math.log(1024)))
          return string.format(" %.2g%sb", fsize / math.pow(1024, i), suffix[i + 1])
        end,
      },
      { provider = "" },
    },
    { ---icon
      provider = h.pad "󰈔",
      hl = function(self)
        return { fg = heirline.get_highlight("Directory").fg, bg = self.size_bg }
      end,
    },
  },
}
--~~}}}

blocks.FileinfoBlock = heirline.insert({
  init = function(self)
    self.buf = vim.api.nvim_buf_get_name(0)
  end,
}, {
  flexible = 1,
  { blocks.FileEncoding, blocks.FileFormat, blocks.FileType },
  { blocks.FileEncoding, blocks.FileType },
  { blocks.FileType },
})

--~ }}}

--~ {{{2 FilePositionBlock

--~~ {{{3 Ruler

blocks.Ruler = {
  hl = function(self)
    return { fg = self.fg, bg = self.bg }
  end,
  {
    flexible = 1,
    ---%l: current line number
    ---%L: number of lines in the buffer
    ---%c: column number
    ---%P: percentage of file scroll
    { provider = h.pad "%7(%03l/%03L%):%02c %P" },
    { provider = h.pad "%7(%03l/%03L%):%02c" },
    { provider = h.pad "%03l:%02c" },
  },
}
--~~ }}}

--~~ {{{3 Scrollbar

blocks.Scrollbar = {
  static = {
    sbar = { "▔", "🭶", "🭷", "🭸", "🭹", "🭺", "🭻", "▁" },
    alacritty_sbar = { "▁", "▂", "▃", "▄", "▅", "▆", "▇", "█" },
  },

  hl = function(self)
    return { fg = theme.ui.pmenu.bg_sbar, bg = self:mode_bg() }
  end,

  {
    flexible = 1,
    {
      provider = function(self)
        if vim.env.TERM == "alacritty" then
          self.sbar = self.alacritty_sbar
        end
        local curr_line = vim.api.nvim_win_get_cursor(0)[1]
        local lines = vim.api.nvim_buf_line_count(0)
        local i = math.floor((curr_line - 1) / lines * #self.sbar) + 1
        return self.sbar[i]
      end,
    },
    { provider = "" },
  },
}
--~~ }}}

blocks.FilePositionBlock = heirline.insert({
  init = function(self)
    self.bg = self:mode_bg()
    self.fg = "bg_dark"
  end,
}, blocks.Ruler, blocks.Scrollbar)
--~ }}}

--~ {{{2 Diagnostics

blocks.Diagnostics = {
  condition = conditions.has_diagnostics,
  init = function(self)
    self.errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
    self.warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
    self.hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
    self.info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
  end,
  update = { "DiagnosticChanged", "BufEnter", "WinResized", "VimResized" },
  hl = { bg = "bg_darkest" },

  on_click = {
    callback = function()
      require("trouble").toggle { mode = "document_diagnostics" }
    end,
    name = "heirline_diagnostics",
  },

  { ---diagnostic group (flexible)
    { ---diagnostic error (flexible)
      flexible = 1,
      hl = { fg = "diag_error" },
      condition = function(self)
        return self.errors > 0
      end,
      {
        provider = function(self)
          return icons.diagnostics.Error .. self.errors .. " "
        end,
      },
      { provider = icons.diagnostics.Error .. " " },
    },
    { ---diagnostic warning (flexible)
      flexible = 1,
      hl = { fg = "diag_warn" },
      condition = function(self)
        return self.warnings > 0
      end,
      {
        provider = function(self)
          return icons.diagnostics.Warn .. self.warnings .. " "
        end,
      },
      { provider = icons.diagnostics.Warn .. " " },
    },
    { ---diagnostic info (flexible)
      flexible = 1,
      hl = { fg = "diag_info" },
      condition = function(self)
        return self.info > 0
      end,
      {
        provider = function(self)
          return icons.diagnostics.Info .. self.info .. " "
        end,
      },
      { provider = icons.diagnostics.Info .. " " },
    },
    { ---diagnostic hint (flexible)
      flexible = 1,
      hl = { fg = "diag_hint" },
      condition = function(self)
        return self.hints > 0
      end,
      {
        provider = function(self)
          return icons.diagnostics.Hint .. self.hints .. " "
        end,
      },
      { provider = icons.diagnostics.Hint .. " " },
    },
  },
}
--~ }}}

--~ {{{2 Lsp

blocks.Lsp = {
  condition = conditions.lsp_attached,
  update = { "LspAttach", "LspDetach", "WinResized", "VimResized" },
  hl = { fg = "green", bg = "bg_darkest", bold = true },

  on_click = {
    callback = function()
      vim.defer_fn(function()
        vim.cmd "LspInfo"
      end, 100)
    end,
    name = "heirline_LSP",
  },

  {
    flexible = 1,
    { ---servers names
      hl = { italic = true },
      provider = function()
        local names = {}
        local clients = vim.lsp.get_clients { bufnr = 0 }
        if vim.fn.has "nvim-0.10.0" == 1 then
          clients = vim.lsp.get_clients { bufnr = 0 }
        end
        for _, server in pairs(clients) do
          table.insert(names, server.name)
        end

        return h.pad(table.concat(names, "/") .. " ")
      end,
    },
    { ---only icon
      provider = h.pad "",
    },
  },
}
--~ }}}

--~ {{{2 TerminalName

blocks.TerminalName = {
  provider = function()
    local tname, _ = vim.api.nvim_buf_get_name(0):gsub(".*:", "")
    return h.pad(" " .. tname)
  end,
  hl = { bg = "bg_darkest", fg = "identifier", bold = true },
}
-- }}}

--~ {{{2 HelpfileName

blocks.HelpfileName = {
  condition = function()
    return vim.bo.filetype == "help"
  end,
  provider = function()
    local filename = vim.api.nvim_buf_get_name(0)
    return h.pad(vim.fn.fnamemodify(filename, ":t") or "")
  end,
  hl = { fg = "diag_ok", bg = "bg_lighter" },
}
--~ }}}

--~ {{{2 LazyUpdate

blocks.LazyUpdate = {
  condition = require("lazy.status").has_updates,
  update = { "User", pattern = "LazyUpdate" },
  provider = function()
    return h.pad(require("lazy.status").updates())
  end,
  on_click = {
    callback = function()
      require("lazy").home()
    end,
    name = "update_plugins",
  },
  hl = { fg = "orange", bg = "bg_darkest" },
}
--~ }}}

--~ {{{2 SearchResults

blocks.SearchResults = {
  condition = function(self)
    local lines = vim.api.nvim_buf_line_count(0)
    if lines > 50000 then
      return
    end

    local query = vim.fn.getreg "/"
    if query == "" or query == nil then
      return
    end

    if query:find "@" then
      return
    end

    local search_count = vim.fn.searchcount { recompute = 1, maxcount = -1 }
    local active = false
    if vim.v.hlsearch and vim.v.hlsearch == 1 and search_count.total > 0 then
      active = true
    end
    if not active then
      return
    end

    query = query:gsub([[^\V]], "")
    query = query:gsub([[\<]], ""):gsub([[\>]], "")

    self.query = query
    self.count = search_count
    return true
  end,
  heirline.surround(
    { h.Separators.circle_thick.l, h.Separators.circle_thick.r },
    heirline.get_highlight("IncSearch").bg,
    {
      provider = function(self)
        return table.concat {
          " ",
          self.query,
          " ",
          self.count.current,
          "/",
          self.count.total,
          " ",
        }
      end,
      hl = "IncSearch",
    }
  ),
}
--~ }}}

-- }}}

-- {{{1 Default.Statusline

---@class Default
local D = {}

--~ {{{2 Default.Leftline

D.Leftline = {
  heirline.insert(blocks.ViMode, { ---separator
    provider = h.Separators.hard_divider.l,
    hl = function(self)
      return { fg = self:mode_bg(), bg = self.mode_fg }
    end,
  }),
  heirline.insert(blocks.WorkingDir, { ---separator
    provider = h.Separators.hard_divider.l,
    hl = function(self)
      return { bg = "bg_light", fg = self.bg, bold = true }
    end,
  }),
  heirline.insert(blocks.FilenameBlock, { ---separator
    provider = h.Separators.hard_divider.l,
    hl = function(self)
      return { fg = self.bg, bg = "bg_darker" }
    end,
  }),
  blocks.GitStatus,
}
--~ }}}

--~ {{{2 Default.Middleline

D.Middleline = { blocks.Break, blocks.SearchResults, blocks.Break }
--~ }}}

--~ {{{2 Default.Rightline

D.Rightline = {
  heirline.insert(blocks.Diagnostics, {
    {
      condition = conditions.lsp_attached,
      provider = h.Separators.soft_divider.r,
      hl = { fg = "grey" },
    },
  }),
  heirline.insert(blocks.Lsp, {
    {
      condition = require("lazy.status").has_updates,
      provider = " " .. h.Separators.soft_divider.r,
      hl = { fg = "grey" },
    },
  }),
  blocks.LazyUpdate,
  -- heirline.insert(blocks.LazyUpdate, {
  --   {
  --     provider = h.Separators.soft_divider.r,
  --     hl = { fg = "grey" },
  --   },
  -- }),
  heirline.insert(
    {
      {
        provider = h.Separators.hard_divider.r,
        hl = { bg = "bg_darkest", fg = "bg_lighter" },
      },
    },
    blocks.FileSize,
    {
      provider = h.Separators.hard_divider.r,
      hl = { fg = "bg_light", bg = "bg_lighter" },
    }
  ),
  heirline.insert(blocks.FileinfoBlock, {
    provider = h.Separators.hard_divider.r,
    hl = function(self)
      return { fg = self:mode_bg(), bg = "bg_light" }
    end,
  }),
  blocks.FilePositionBlock,
  -- heirline.insert(blocks.FilePositionBlock, {
  --   provider = " ",
  --   hl = function(self)
  --     return { bg = self:mode_bg(), fg = self.fg }
  --   end,
  -- }),
}
--~ }}}

D.Statusline = { D.Leftline, D.Middleline, D.Rightline }

-- }}}

-- {{{1 Terminal.Statusline

---@class Terminal
local T = {}

T.Statusline = heirline.insert({
  condition = function()
    return conditions.buffer_matches { buftype = { "terminal" } }
  end,
}, {
  {
    condition = conditions.is_active,
    heirline.insert(blocks.ViMode, { ---separator (static)
      provider = h.Separators.hard_divider.l,
      hl = function(self)
        return { fg = self:mode_bg(), bg = "bg_light" }
      end,
    }),
  },
  heirline.insert(blocks.FileType, {
    provider = h.Separators.hard_divider.l,
    hl = function()
      return { bg = "bg_darkest", fg = "bg_light" }
    end,
  }),
  blocks.TerminalName,
  blocks.Align,
  blocks.SearchResults,
})
-- }}}

-- {{{1 Special.Statusline

---@class Special
local S = {}

--~ {{{2 Special.Leftline

S.Leftline = {
  blocks.FileType,
  heirline.insert(
    {
      {
        provider = h.Separators.hard_divider.l,
        hl = function()
          if vim.bo.filetype == "help" then
            return { fg = "bg_light", bg = "bg_lighter" }
          else
            return { fg = "bg_light", bg = "bg_darker" }
          end
        end,
      },
    },
    blocks.HelpfileName,
    {
      condition = function()
        return vim.bo.filetype == "help"
      end,
      provider = h.Separators.hard_divider.l,
      hl = { fg = "bg_lighter", bg = "bg_darkest" },
    }
  ),
}
--~ }}}

--~ {{{2 Special.Middleline

S.Middleline = { blocks.Break, blocks.SearchResults, blocks.Break }
--~ }}}

--~ {{{2 Special.Rightline

S.Rightline = {
  {
    provider = h.Separators.hard_divider.r,
    hl = { bg = "bg_darkest", fg = "bg_lighter" },
  },
  heirline.insert(blocks.FileSize, {
    provider = h.Separators.hard_divider.r,
    hl = function(self)
      return { fg = self:mode_bg(), bg = "bg_lighter" }
    end,
  }),
  heirline.insert(blocks.FilePositionBlock, {
    provider = " ",
    hl = function(self)
      return { bg = self:mode_bg(), fg = self.fg }
    end,
  }),
}
--~ }}}

S.Statusline = heirline.insert({
  condition = function()
    return conditions.buffer_matches {
      buftype = { "nofile", "prompt", "help", "quickfix" },
      filetype = { "^git.*", "fugitive" },
    }
  end,
}, S.Leftline, S.Middleline, S.Rightline)
-- }}}

return heirline.insert(M, S.Statusline, T.Statusline, D.Statusline)

-- vim: fdm=marker
