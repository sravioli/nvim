---functions for telescope.nvim
---
---@class Fun.telescope
local M = {}

---Finds files in current directory with `git_files` or fallbacks to `find_files`
M.fd = function()
	vim.fn.system("git rev-parse --is-inside-work-tree")
	if vim.v.shell_error == 0 then
		vim.fn.system("git diff-index --quiet HEAD")
		if vim.v.shell_error == 0 then
			require("telescope.builtin").git_files({})
		end
	end
	require("telescope.builtin").find_files({})
end

---Previews an image using `Chafa`
---@param filepath string the path of the file to preview
---@param bufnr number the buffer number
---@param opts table options
M.preview_img = function(filepath, bufnr, opts)
	local is_image = function(path)
		local image_extensions = { "png", "jpg", "gif" } ---Supported image formats
		local split_path = vim.split(path:lower(), ".", { plain = true })
		local extension = split_path[#split_path]
		return vim.tbl_contains(image_extensions, extension)
	end

	if is_image(filepath) then
		local term = vim.api.nvim_open_term(bufnr, {})
		local function send_output(_, data, _)
			for _, d in ipairs(data) do
				vim.api.nvim_chan_send(term, d .. "\r\n")
			end
		end
		vim.fn.jobstart({ "chafa", filepath }, {
			on_stdout = send_output,
			stdout_buffered = true,
			pty = true,
		})
	else
		require("telescope.previewers.utils").set_preview_message(bufnr, opts.winid, "Binary cannot be previewed")
	end
end

return M
