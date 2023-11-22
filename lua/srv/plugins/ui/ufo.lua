--# selene: allow(mixed_table)

return {
  ---Not UFO in the sky, but an ultra fold in Neovim.
  "kevinhwang91/nvim-ufo",
  enabled = true,
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
      local fold_indicator = {}

      local n_lines = endLnum - lnum
      local plural = n_lines == 1 and "" or "s"
      local percentage = n_lines / vim.api.nvim_buf_line_count(0) * 100
      local msg = (" ↙️ %d line%s (%d%%)"):format(n_lines, plural, percentage)
      local msg_width = vim.fn.strdisplaywidth(msg)

      local target_width, current_width = width - vim.fn.strdisplaywidth(msg), 0
      for _, text_chunk in ipairs(virtText) do
        local text, hl = unpack(text_chunk)
        local text_width = vim.fn.strdisplaywidth(text)

        if target_width > current_width + text_width then
          table.insert(fold_indicator, text_chunk)
        else
          text = truncate(text, target_width - current_width)
          table.insert(fold_indicator, { text, hl })

          text_width = vim.fn.strdisplaywidth(text)

          ---string from `truncate()` can be less than 2nd arg => pad it
          if current_width + text_width < target_width then
            msg = msg .. (" "):rep(target_width - current_width - text_width)
          end

          break
        end

        current_width = current_width + text_width
      end

      ---place fold indicator at the colorcolumn/textwidth. if they go off-screen place
      ---the indicator to the closest possible

      local rightmost_col =
        math.max(vim.opt_local.colorcolumn["_value"], vim.opt_local.textwidth["_value"])
      local closest_col = math.min(rightmost_col, width - 1)
      local left_padding = math.max(closest_col - current_width - msg_width, 0)
      local right_padding = 2

      msg = (" "):rep(left_padding - right_padding) .. msg
      table.insert(fold_indicator, { msg, "MoreMsg" })

      return fold_indicator
    end,
  },

  config = function(_, opts)
    require("ufo").setup(opts)
    require("srv.utils.keymaps").load "ufo"
  end,
}
