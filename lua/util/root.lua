local M = {}

M.root_patterns = { ".git", "go.mod", "pyproject.toml", "package.json", "Makefile" }

function M.get(buf)
	buf = buf or vim.api.nvim_get_current_buf()
	local path = vim.api.nvim_buf_get_name(buf)
	if path == "" then
		return vim.uv.cwd()
	end
	path = vim.fn.fnamemodify(path, ":p:h")

	local root = vim.fs.find(M.root_patterns, { path = path, upward = true })[1]
	if root then
		return vim.fn.fnamemodify(root, ":h")
	end

	return vim.uv.cwd()
end

return M
