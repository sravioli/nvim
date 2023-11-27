return {
  ---Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua.
  "nvimtools/none-ls.nvim",
  dependencies = { { "nvim-lua/plenary.nvim" } },
  event = require("srv.utils.event").events.LazyFile,
  opts = function()
    local present, null_ls = pcall(require, "null-ls")
    if not present then
      return
    end

    local function search_config_file(filename)
      for _, dir in pairs {
        require("null-ls.utils").get_root(),
        vim.fn.expand "%:p:h",
        vim.fn.resolve(vim.fn.stdpath "config" .. [[\skel]]),
      } do
        vim.notify(("[null-ls] searching '%s'"):format(filename), vim.log.levels.TRACE)
        local file = vim.fn.findfile(vim.fn.resolve(dir .. "/" .. filename))
        if file ~= "" then
          vim.notify(("[null-ls] found '%s'"):format(file), vim.log.levels.TRACE)
          return file
        end
      end
      return ""
    end

    ---@type table Shorthand for `null_ls.builtins.diagnostics`
    local diagnostics = null_ls.builtins.diagnostics

    ---@type table Shorthand for `null_ls.builtins.formatting`
    local formatting = null_ls.builtins.formatting

    ---@type table Shorthand for `null_ls.builtins.code_actions`
    -- local code_actions = null_ls.builtins.code_actions

    return {
      border = require("srv.preferences").border,
      diagnostics_format = "[#{c}] #{m} (#{s})",
      update_in_insert = false,
      on_attach = require("srv.utils.fn").lsp.autoformat,

      sources = {
        ---slows down editor a bit
        -- diagnostics.cspell,
        -- code_actions.cspell.with {
        --   config = {
        --     on_success = function(cspell_config_file, params)
        --       -- format the cspell config file
        --       os.execute(
        --         string.format(
        --           "cat %s | jq -S '.words |= sort' | tee %s > /dev/null",
        --           cspell_config_file,
        --           cspell_config_file
        --         )
        --       )
        --     end,
        --   },
        -- },

        ---general spelling
        diagnostics.codespell,

        ---markdown
        diagnostics.markdownlint.with {
          extra_args = function()
            local file = search_config_file ".markdownlint.jsonc"
            if file ~= "" then
              return { "--config", file }
            end
            return {}
          end,
        },
        formatting.markdownlint,
        formatting.cbfmt,

        ---lua
        diagnostics.luacheck.with {
          extra_args = function()
            local file = search_config_file ".luacheckrc"
            if file ~= "" then
              return { "--config", file }
            end
            return {}
          end,
        },
        diagnostics.selene,
        formatting.stylua.with {
          extra_args = function()
            local file = search_config_file ".stylua.toml"
            if file ~= "" then
              return { "--config-path", file }
            end
            return {}
          end,
        },

        ---toml
        formatting.taplo.with {
          extra_args = function()
            local file = search_config_file ".taplo.toml"
            if file ~= "" then
              return { "--config", file }
            end
            return {}
          end,
        },

        ---yaml
        diagnostics.yamllint,
        formatting.yamlfix.with {
          extra_args = function()
            local file = search_config_file ".yamlfix.toml"
            if file ~= "" then
              return { "--config-file", file }
            end
            return {}
          end,
        },

        ---json
        formatting.fixjson.with {
          args = { "--indent", vim.opt.tabstop:get() },
        },

        ---C/C++
        diagnostics.cpplint,
        formatting.clang_format.with {
          extra_args = function()
            local file = search_config_file ".clang-format"
            if file ~= "" then
              return { "--style=file:" .. file }
            end
            return {}
          end,
        },

        ---latex
        formatting.latexindent,
        diagnostics.chktex,
      },
    }
  end,
}
