---@module "srv.keymaps.lsp"
---@author sravioli
---@license GNU-GPLv3

local Keymap = require "srv.utils.keymap"
local LspKeymaps = Keymap:create() --[[@class Keymap]]

local prefs = require "srv.preferences"
local lsp = vim.lsp.buf
local diagnostic = vim.diagnostic

LspKeymaps:add {
  { "gD", lsp.declaration, desc = "Declaration", icon = "󰞘" },
  { "K", lsp.hover, desc = "Hover doc", icon = "󱓂" },
  { "gi", lsp.implementation, desc = "Implementation", icon = "󱞥" },
  {
    "<leader>th",
    function()
      vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
    end,
    desc = "Toggle inlay hints",
    icon = "󰔡",
  },
  { "<leader>ls", lsp.signature_help, desc = "Signature help", icon = "󰋖" },
  { "<leader>D", lsp.type_definition, desc = "Definition type", icon = "" },
  { "<leader>cr", lsp.rename, desc = "Rename", icon = "󰑕" },
  { "<leader>ca", lsp.code_action, desc = "Code action", icon = "󱐋" },
  { "gr", lsp.references, desc = "LSP references", icon = "" },

  {
    "<leader>k",
    function()
      diagnostic.open_float { border = prefs.border }
    end,
    desc = "Floating diagnostic",
    icon = "󱖫",
  },
  {
    "[d",
    function()
      diagnostic.jump { count = -1, float = { border = prefs.border } }
    end,
    desc = "Previous diagnostic",
    icon = "󰼨",
  },

  {
    "]d",
    function()
      diagnostic.jump { count = 1, float = { border = prefs.border } }
    end,
    desc = "Next diagnostic",
    icon = "󰼧",
  },

  { "<leader>q", diagnostic.setloclist, desc = "Diagnostic setloclist", icon = "󱖫" },

  {
    "<leader>fm",
    function()
      lsp.format { async = true }
    end,
    desc = "LSP async formatting",
    icon = "󰉢",
  },
  {
    "<leader>wa",
    lsp.add_workspace_folder,
    desc = "Add workspace folder",
    icon = "󰉗",
  },
  {
    "<leader>wr",
    lsp.remove_workspace_folder,
    desc = "Remove workspace folder",
    icon = "󰉘",
  },
  {
    "<leader>wl",
    function()
      print(vim.inspect(lsp.list_workspace_folders()))
    end,
    desc = "List workspace folders",
    icon = "",
  },
}

LspKeymaps:set_icon_color "orange"

return LspKeymaps
