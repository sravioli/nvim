return {
  ---Use Neovim as a language server to inject LSP diagnostics, code actions,
  ---and more via Lua.
  "jose-elias-alvarez/null-ls.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  event = "BufWinEnter",
  config = function()
    local present, null_ls = pcall(require, "null-ls")
    if not present then
      return
    end

    ---@type table Shorthand for `null_ls.builtins.diagnostics`
    local diagnostics = null_ls.builtins.diagnostics
    ---@type table Shorthand for `null_ls.builtins.formatting`
    local formatting = null_ls.builtins.formatting

    local opts = {
      border = require("preferences").border,
      diagnostics_format = "[#{c}] #{m} (#{s})",
      update_in_insert = false,
      on_attach = require("utils.fn").lsp.autoformat,
      sources = {
        -- null_ls.builtins.diagnostics.cspell,
        -- null_ls.builtins.code_actions.cspell.with {
        --   config = {
        --     on_success = function(cspell_config_file, params)
        --       -- format the cspell config file
        --       os.execute(
        --         string.format("cat %s | jq -S '.words |= sort' | tee %s > /dev/null", cspell_config_file, cspell_config_file)
        --       )
        --     end,
        --   },
        -- },

        diagnostics.codespell,

        diagnostics.markdownlint,
        formatting.markdownlint,
        formatting.cbfmt,

        formatting.stylua,
        formatting.taplo,

        diagnostics.yamllint,
        formatting.yamlfix.with {
          extra_args = function()
            local file = vim.fn.findfile ".yamlfix.toml"
            if file then
              return { "--config-file", file }
            else
              return {}
            end
          end,
        },
        diagnostics.actionlint,

        formatting.fixjson,

        diagnostics.cpplint,
        formatting.clang_format.with {
          extra_args = {
            "--style",
            "{SpacesBeforeTrailingComments: 2, "
              .. "AlignTrailingComments: {Kind: Always, OverEmptyLines: 2}}",
          },
        },

        formatting.latexindent,
        diagnostics.chktex,
      },
    }

    null_ls.setup(opts)
  end,
}
