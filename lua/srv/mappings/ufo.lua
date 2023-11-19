---@class Mappings
return {
  autoload = false,

  n = {
    ["zR"] = { require("ufo").openAllFolds, "󱃄  Open all folds" },
    ["zM"] = { require("ufo").closeAllFolds, "󱃄  Close all folds" },
    ["zr"] = { require("ufo").openFoldsExceptKinds, "󱃄  Open all folds except kinds" },
    ["zm"] = { require("ufo").closeFoldsWith, "󱃄  Close all folds with" },
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
