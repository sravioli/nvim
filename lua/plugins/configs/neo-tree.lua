local present, neo_tree = pcall(require, "neo-tree")
if not present then
  return
end

local opts = {}

neo_tree.setup(opts)
