local present, null_ls = pcall(require, "null-ls")
if not present then
  return
end

local lsp_formatting = require("utils.augroups").null_ls

local function null_ls_attach(client, bufnr)
  if client.supports_method "textDocument/formatting" then
    vim.api.nvim_clear_autocmds { group = lsp_formatting, buffer = bufnr }
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = lsp_formatting,
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format { bufnr = bufnr }

        -- Caveats!
        -- Async formatting works by sending a formatting request, then applying
        -- and writing results once they're received. This lets you move the
        -- cursor, scroll, and otherwise interact with the window while waiting
        -- for results, which can make formatting seem more responsive (but doesn't actually speed it up).
        -- The async formatting implementation here comes with the following caveats:
        -- * If you edit the buffer in between sending a request and receiving results, those results won't be applied.
        -- * Each save will result in writing the file to the disk twice.
        -- * `:wq` will not format the file before quitting.
        -- require("utils.fn").async_formatting(bufnr)  -- for async formatting
      end,
    })
  end
end

local opts = {
  border = require("preferences").border,
  diagnostics_format = "[#{c}] #{m} (#{s})",
  update_in_insert = false,
  on_attach = null_ls_attach,
  sources = {
    -- DIAGNOSTICS
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
