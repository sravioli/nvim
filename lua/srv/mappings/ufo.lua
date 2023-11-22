---@class Mappings
return {
  autoload = false,

  n = {
    ["zR"] = {
      function()
        require("ufo").openAllFolds()
      end,
      "󱃄  Open all folds",
    },
    ["zM"] = {
      function()
        require("ufo").closeAllFolds()
      end,
      "󱃄  Close all folds",
    },
    ["zr"] = {
      function()
        require("ufo").openFoldsExceptKinds()
      end,
      "󱃄  Open all folds except kinds",
    },
    ["zm"] = {
      function()
        require("ufo").closeFoldsWith()
      end,
      "󱃄  Close all folds with",
    },
    ["zk"] = {
      function()
        if not require("ufo").peekFoldedLinesUnderCursor() then
          vim.lsp.buf.hover()
        end
      end,
      "󱃄  Preview fold",
    },
  },
}
