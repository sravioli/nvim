local fun = require "srv.utils.fun" ---@class Fun
local events = require "srv.utils.events" ---@class Events

return {
  ---asynchronous linter plugin for Neovim complementary to the built-in LSP support.
  "mfussenegger/nvim-lint",
  event = events.LazyFile,
  config = function()
    local lint = require "lint"
    lint.linters_by_ft = {
      markdown = { "markdownlint" },
      lua = { "luacheck", "selene" },
      yaml = { "yamllint" },
      c = { "cpplint" },
      cpp = { "cpplint" },
    }

    local linters = lint.linters

    linters.markdownlint = fun.linter.extend(linters.markdownlint, {
      cmd = "markdownlint-cli2",
      args = function()
        local file = fun.search_file(
          ".markdownlint.jsonc",
          ".markdownlint.json",
          ".markdownlint.yaml",
          ".markdownlint.yml",
          ".markdownlint.cjs",
          ".markdownlint.mjs"
        )
        return file and { "--config", file } or {}
      end,
    })

    linters.luacheck.args = fun.linter.extend_args(linters.luacheck.args, function()
      local file = fun.search_file ".luacheckrc"
      return file and { "--config", file } or {}
    end)

    vim.api.nvim_create_autocmd(events.TriggerLint, {
      callback = function()
        require("lint").try_lint()
        -- require("lint").try_lint "cspell"
      end,
    })
  end,
}

