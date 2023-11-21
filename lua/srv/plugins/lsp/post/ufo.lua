return {
  ---Not UFO in the sky, but an ultra fold in Neovim.
  "kevinhwang91/nvim-ufo",
  enabled = false,
  dependencies = {
    { "kevinhwang91/promise-async" },
    {
      ---Status column plugin that provides a configurable 'statuscolumn' and click handlers.
      "luukvbaal/statuscol.nvim",
      opts = function()
        local builtin = require "statuscol.builtin"
        return {
          relculright = true,
          segments = {
            { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
            { text = { "%s" }, click = "v:lua.ScSa" },
            { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
          },
        }
      end,
    },
  },
  event = require("srv.utils.event").events.LazyFile,
  cmd = {
    "UfoEnable",
    "UfoDisable",
    "UfoInspect",
    "UfoAttach",
    "UfoDetach",
    "UfoEnableFold",
    "UfoDisableFold",
  },
  init = function()
    vim.opt.foldcolumn = "1" -- '0' is not bad
    vim.opt.foldlevel = 99 -- Using ufo provider need a large value
    vim.opt.foldlevelstart = 99
    vim.opt.foldenable = true
  end,
  opts = {
    close_fold_kinds = { "comment", "imports" },

    provider_selector = function(bufnr, filetype, _)
      local fmap = { lua = { "lsp", "treesitter" } }

      return fmap[filetype]
        or function()
          local function handle_fallback_exception(err, providerName)
            if type(err) == "string" and err:match "UfoFallbackException" then
              return require("ufo").getFolds(bufnr, providerName)
            else
              return require("promise").reject(err)
            end
          end

          return require("ufo")
            .getFolds(bufnr, "lsp")
            :catch(function(err)
              return handle_fallback_exception(err, "treesitter")
            end)
            :catch(function(err)
              return handle_fallback_exception(err, "indent")
            end)
        end
    end,

    preview = {
      win_config = {
        winhighlight = "Normal:NormalDark",
        winblend = vim.opt.pumblend:get(),
      },
    },

    enable_get_fold_virt_text = true,
    fold_virt_text_handler = function(virtText, lnum, endLnum, width, truncate)
      local new_virt_text = {}

      local folded_lines = endLnum - lnum
      local suffix = (" ↙️ %d %d%%"):format(
        folded_lines,
        folded_lines / vim.api.nvim_buf_line_count(0) * 100
      )
      local suf_width = vim.fn.strdisplaywidth(suffix)
      local target_width = width - suf_width
      local cur_width = 0
      for _, chunk in ipairs(virtText) do
        local chunk_text = chunk[1]
        local chunk_width = vim.fn.strdisplaywidth(chunk_text)
        if target_width > cur_width + chunk_width then
          table.insert(new_virt_text, chunk)
        else
          chunk_text = truncate(chunk_text, target_width - cur_width)
          local hl_group = chunk[2]
          table.insert(new_virt_text, { chunk_text, hl_group })
          chunk_width = vim.fn.strdisplaywidth(chunk_text)
          -- str width returned from truncate() may less than 2nd argument, need padding
          if cur_width + chunk_width < target_width then
            suffix = suffix .. (" "):rep(target_width - cur_width - chunk_width)
          end
          break
        end
        cur_width = cur_width + chunk_width
      end
      local r_align_appndx = math.max(
        math.min(vim.opt.textwidth["_value"], width - 1) - cur_width - suf_width,
        0
      )
      suffix = (" "):rep(r_align_appndx) .. suffix
      table.insert(new_virt_text, { suffix, "MoreMsg" })
      return new_virt_text
    end,
  },

  config = function(_, opts)
    require("ufo").setup(opts)
    require("srv.utils.keymaps").load "ufo"
  end,
}
