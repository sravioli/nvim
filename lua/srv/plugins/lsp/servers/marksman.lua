local lsp_utils = require "lspconfig.util"

return {
  root_dir = function()
    local root_files = {
      "mkdocs.yml",
      "mkdocs.yaml",
      "README.md",
    }

    local fallback_root_files = {
      "package.json",
      ".marksman.toml",
    }

    local git_ancestor = lsp_utils.find_git_ancestor()
    local primary = lsp_utils.root_pattern(unpack(root_files))
    local fallback = lsp_utils.root_pattern(unpack(fallback_root_files))

    return git_ancestor or primary or fallback
  end,
  single_file_support = true,
}
