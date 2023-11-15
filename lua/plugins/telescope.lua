local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	return
end

local builtin = require("telescope.builtin")
local actions = require("telescope.actions")
vim.keymap.set("n", "<C-p>", builtin.find_files, {})
-- vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
vim.keymap.set("n", "<leader>P", builtin.commands, {})

telescope.setup({
	defaults = {
		mapping = {
			i = {
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_next,
			},
		},
	},
})
