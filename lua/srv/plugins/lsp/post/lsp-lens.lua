return {
  ---Neovim plugin for displaying references and definition infos upon functions like JB's
  ---IDEA.
  "VidocqH/lsp-lens.nvim",
  event = "LspAttach",
  cmd = { "LspLensOn", "LspLensOff", "LspLensToggle" },
  opts = {
    enable = true,
    include_declaration = true, -- Reference include declaration
    sections = { -- Enable/Disable specific request
      definition = function(count)
        return " " .. count
      end,
      references = function(count)
        return " " .. count
      end,
      implements = function(count)
        return " " .. count
      end,
      git_authors = function(latest_author, count)
        return "  " .. latest_author .. (count - 1 == 0 and "" or " +" .. count - 1)
      end,
    },
  },
}
