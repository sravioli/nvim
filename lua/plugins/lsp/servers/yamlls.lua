return {
  cmd = { "yaml-language-server", "--stdio" },
  filetypes = { "yaml", "yaml.docker-compose", "yml" },

  yamlVersion = "1.2",

  format = {
    enable = false,
    singleQuote = false,
    bracketSpacing = true,
    proseWrap = "Always",
    printWidth = 79,
  },

  validate = true, -- TODO: conflicts between Kubernetes resources and kustomization.yaml
  hover = true,
  completion = true,

  schemas = {
    kubernetes = "*.yaml",
    ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*.{yml,yaml}",
    ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
    ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
    ["http://json.schemastore.org/prettierrc"] = ".prettierrc.{yml,yaml}",
    ["http://json.schemastore.org/kustomization"] = "kustomization.{yml,yaml}",
    ["http://json.schemastore.org/ansible-playbook"] = "*play*.{yml,yaml}",
    ["http://json.schemastore.org/chart"] = "Chart.{yml,yaml}",
    ["https://json.schemastore.org/dependabot-v2"] = ".github/dependabot.{yml,yaml}",
    ["https://json.schemastore.org/gitlab-ci"] = "*gitlab-ci*.{yml,yaml}",
    ["https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.1/schema.json"] = "*api*.{yml,yaml}",
    ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "*docker-compose*.{yml,yaml}",
    ["https://raw.githubusercontent.com/argoproj/argo-workflows/master/api/jsonschema/schema.json"] = "*flow*.{yml,yaml}",
    ["https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/schema.json"] = "*.omp.yaml",
  },

  schemaStore = {
    enable = true,
    url = "https://www.schemastore.org/api/json/catalog.json",
  },

  maxItemsComputed = 5,

  editor = {
    tabSize = 2,
    formatOnType = false,
  },

  single_file_support = true,
}
