---functions for nvim-tree
---
---@class Fun.tree
local M = {}

M.on_attach = function(bufnr)
	local api = require("nvim-tree.api")
	local function opts(desc)
		return {
			desc = "󰔱  " .. desc,
			buffer = bufnr,
			noremap = true,
			silent = true,
			nowait = true,
		}
	end

	---load default keymaps
	api.config.mappings.default_on_attach(bufnr)

	--~ {{{1 h, j, k, l Style Navigation And Editing
	local function edit_or_open()
		local node = api.tree.get_node_under_cursor()
		if node.nodes ~= nil then
			api.node.open.edit() -- expand or collapse folder
		else
			api.node.open.edit() -- open file
			api.tree.close() -- Close the tree if file was opened
		end
	end

	-- open as vsplit on current node
	local function vsplit_preview()
		local node = api.tree.get_node_under_cursor()
		if node.nodes ~= nil then
			api.node.open.edit() -- expand or collapse folder
		else
			api.node.open.vertical() -- open file as vsplit
		end

		-- Finally refocus on tree if it was lost
		api.tree.focus()
	end

	-- on_attach
	vim.keymap.set("n", "l", edit_or_open, opts("Edit Or Open"))
	vim.keymap.set("n", "L", vsplit_preview, opts("Vsplit Preview"))
	vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Close"))
	--~ }}}

	---open on file creation
	api.events.subscribe(
		api.events.Event.FileCreated,
		vim.schedule_wrap(function(file)
			vim.cmd.edit(file.fname)
		end)
	)
end

return M
