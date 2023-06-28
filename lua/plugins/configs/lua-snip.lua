local present, ls = pcall(require, "luasnip")
if not present then
  return
end

local opts = {
  history = true,
  update_events = { "TextChanged", "TextChangedI" },
  region_check_events = { "CursorMoved", "CursorHold", "InsertEnter" },
  snip_env = {},
}

ls.config.set_config(opts)

-- vscode format
require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_vscode").lazy_load {
  paths = vim.g.vscode_snippets_path or "",
}

-- snipmate format
require("luasnip.loaders.from_snipmate").load()
require("luasnip.loaders.from_snipmate").lazy_load {
  paths = vim.g.snipmate_snippets_path or "",
}

-- lua format
require("luasnip.loaders.from_lua").load()
require("luasnip.loaders.from_lua").lazy_load { paths = vim.g.lua_snippets_path or "" }

vim.api.nvim_create_autocmd("InsertLeave", {
  callback = function()
    if
      ls.session.current_nodes[vim.api.nvim_get_current_buf()]
      and not ls.session.jump_active
    then
      ls.unlink_current()
    end
  end,
})
