local insert = table.insert

---@class Keymap
local M = {}

---Creates a new Keymap instance.
---Initializes a new instance of the Keymap class with empty operations and keys tables.
---@return Keymap instance New Keymap instance
function M:create()
  local instance = { operations = {}, keys = {} }
  setmetatable(instance, { __index = self })
  return instance
end

---Add multiple key mappings at once.
---Adds the specified key mappings to the keys table.
---@param mappings table List of key mappings to add
function M:add(mappings)
  for _, mapping in ipairs(mappings) do
    insert(self.keys, mapping)
  end
end

---Buffer an operation to wait for a plugin to load.
---Adds an operation to the operations table that sets a condition on each key mapping
---to check if the specified plugin is loaded.
---@param name string Name of the plugin to wait for
function M:wait_plugin_load(name)
  insert(self.operations, function(mapping)
    mapping.cond = function()
      if select(2, pcall(require, name)) then
        return true
      end
      return false
    end
  end)
end

---Buffer an operation to inject a field into each key mapping.
---Adds an operation to the operations table that injects the specified field into each
---key mapping in the keys table.
---@param field table Field to inject into each key mapping
function M:inject(field)
  insert(self.operations, function(mapping)
    for k, v in pairs(field) do
      mapping[k] = v
    end
  end)
end

---Modify the icon value in the mapping.
---This function buffers an operation to set the icon field.
---@param icon string The icon to use.
function M:set_icon(icon)
  insert(self.operations, function(mapping)
    if type(mapping.icon) ~= "table" then
      mapping.icon = { icon = icon }
    else
      mapping.icon.icon = icon
    end
  end)
end

--- Modify the highlight group in the mapping.
--- This function buffers an operation to set the highlight group for the icon.
--- @param hl string The highlight group to use for the icon.
function M:set_icon_hl(hl)
  local op = function(mapping)
    if type(mapping.icon) ~= "table" then
      mapping.icon = { hl = hl }
    else
      mapping.icon.hl = hl
    end
  end

  insert(self.operations, op)
end

---Modify the color of the icon in the mapping.
---This function buffers an operation to set the color for the icon.
---@param color "azure"|"blue"|"cyan"|"green"|"grey"|"orange"|"purple"|"red"|"yellow" The color to use for the icon.
function M:set_icon_color(color)
  insert(self.operations, function(mapping)
    local field_value = { color = color }
    if type(mapping.icon) == "table" then
      for k, v in pairs(field_value) do
        mapping.icon[k] = v
      end
    elseif type(mapping.icon) == "string" then
      local existing_value = mapping.icon
      mapping.icon = { icon = existing_value }
      for k, v in pairs(field_value) do
        mapping.icon[k] = v
      end
    elseif type(mapping.icon) == "function" then
      local existing_value = mapping.icon()
      mapping.icon = { icon = existing_value }
      for k, v in pairs(field_value) do
        mapping.icon[k] = v
      end
    else
      mapping.icon = field_value
    end
  end)
end

--- Modify the category of the icon in the mapping.
--- This function buffers an operation to set the category for the icon.
--- @param cat string The category of the icon. Valid categories: file, filetype, extension.
function M:set_icon_cat(cat)
  insert(self.operations, function(mapping)
    if type(mapping.icon) ~= "table" then
      mapping.icon = { cat = cat }
    else
      mapping.icon.cat = cat
    end
  end)
end

---Modify the name of the icon in the mapping.
---This function buffers an operation to set the name of the icon within the specified
---category.
---@param name_value string The name of the icon in the specified category.
function M:set_icon_name(name_value)
  insert(self.operations, function(mapping)
    if type(mapping.icon) ~= "table" then
      mapping.icon = { name = name_value }
    else
      mapping.icon.name = name_value
    end
  end)
end

---Apply all buffered operations to the keytable.
---Iterates over the keys table and applies all buffered operations to each key mapping.
---Clears the operations table after applying all operations.
---@return table Modified key mappings
function M:apply()
  for _, mapping in ipairs(self.keys) do
    for _, operation in ipairs(self.operations) do
      operation(mapping)
    end
  end
  self.operations = {} -- Clear operations after applying
  return self.keys
end

---Pretty prints the keys table
function M:inspect()
  vim.print(self.keys)
end

function M:register()
  local ok, wk = pcall(require, "which-key")
  if not ok then
    return
  end
  wk.add(self:apply())
end

---Loads the plugin keymaps
---@param plugin string Plugin name
---@return nil|Keymap keymaps nil when no file is found, otherwise the Keymaps.
function M.load(plugin)
  local path = "srv.keymaps." .. plugin
  local ok, keymaps = pcall(require, path)
  if not ok then
    return vim.notify("No keymaps exists at path: " .. path)
  end
  return keymaps
end

function M:lazy_handler()
  local handler = {}
  for _, map in ipairs(self.keys) do
    insert(handler, { map[1], map[2], desc = map.desc })
  end
  return handler
end

return M
