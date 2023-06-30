return {
  format = { enabled = false },
  schemas = {
    {
      description = "ESLint config",
      fileMatch = { ".eslintrc.json", ".eslintrc" },
      url = "http://json.schemastore.org/eslintrc",
    },
    {
      description = "Package config",
      fileMatch = { "package.json" },
      url = "https://json.schemastore.org/package",
    },
    {
      description = "Packer config",
      fileMatch = { "packer.json" },
      url = "https://json.schemastore.org/packer",
    },
    {
      description = "Renovate config",
      fileMatch = {
        "renovate.json",
        "renovate.json5",
        ".github/renovate.json",
        ".github/renovate.json5",
        ".renovaterc",
        ".renovaterc.json",
      },
      url = "https://docs.renovatebot.com/renovate-schema",
    },
    {
      description = "OpenApi config",
      fileMatch = { "*api*.json" },
      url = "https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.1/schema.json",
    },
    {
      description = "oh-my-posh config",
      fileMatch = { "*omp.json" },
      url = "https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/schema.json",
    },
    {
      description = "cspell config",
      fileMatch = {
        ".cspell.json",
        "cspell.json",
        ".cSpell.json",
        "cSpell.json",
        "cspell.config.js",
        "cspell.config.cjs",
        "cspell.config.json",
        "cspell.config.yaml",
        "cspell.config.yml",
        "cspell.yaml",
        "cspell.yml",
      },
      url = "https://raw.githubusercontent.com/streetsidesoftware/cspell/main/cspell.schema.json",
    },
  },
}
