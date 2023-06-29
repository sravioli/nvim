return {
  -- Use Neovim as a language server to inject LSP diagnostics, code actions,
  -- and more via Lua.
  "jose-elias-alvarez/null-ls.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  event = "BufWinEnter",
  config = function()
    local present, null_ls = pcall(require, "null-ls")
    if not present then
      return
    end

    local opts = {
      border = require("preferences").border,
      diagnostics_format = "[#{c}] #{m} (#{s})",
      update_in_insert = false,
      on_attach = require("utils.fn").null_ls_autoformat,
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

        null_ls.builtins.diagnostics.codespell,

        null_ls.builtins.diagnostics.markdownlint,
        null_ls.builtins.formatting.markdownlint,
        null_ls.builtins.formatting.cbfmt,

        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.taplo,

        null_ls.builtins.diagnostics.yamllint,
        null_ls.builtins.formatting.yamlfix.with {
          extra_args = function()
            local file = vim.fn.findfile ".yamlfix.toml"
            if file then
              print "file found"
              return { "--config-file", file }
            else
              print "no file, no config"
              return {}
            end
          end,
        },
        null_ls.builtins.diagnostics.actionlint,

        null_ls.builtins.formatting.fixjson,

        null_ls.builtins.diagnostics.cpplint,
        null_ls.builtins.formatting.clang_format.with {
          extra_args = {
            "--style",
            "{SpacesBeforeTrailingComments: 2, AlignTrailingComments: {Kind: Always, OverEmptyLines: 2}}",
          },
        },

        null_ls.builtins.formatting.latexindent,
        null_ls.builtins.diagnostics.chktex,
      },
    }

    null_ls.setup(opts)
  end,
}
