local status_ok, tree = pcall(require, "chadtree")
if not status_ok then
	return
end

local map = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }

map("n", "<C-n>", ":NvimTreeToggle<CR>", default_opts)

