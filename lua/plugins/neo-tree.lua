local status_ok, neo_tree = pcall(require, "neo-tree")
if not status_ok then
	return
end

local map = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }

-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1
vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
map("n", "<C-n>", ":Neotree reveal<CR>", default_opts)

vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint" })

require("window-picker").setup({
	autoselect_one = true,
	include_current = false,
	selection_chars = "ABCDEFGHIJLK",
	filter_rules = {
		-- filter using buffer options
		bo = {
			-- if the file type is one of following, the window will be ignored
			filetype = { "neo-tree", "neo-tree-popup", "notify" },

			-- if the buffer type is one of following, the window will be ignored
			buftype = { "terminal", "quickfix" },
		},
	},
	other_win_hl_color = "#e35e4f",
})

neo_tree.setup({
	close_if_last_window = true,
	window = {
		mappings = {
			["<esc>"] = "revert_preview",
			["P"] = { "toggle_preview", config = { use_float = true } },
			["l"] = "open_with_window_picker",
		},
	},
	event_handlers = {
		{
			event = "file_opened",
			handler = function(file_path)
				neo_tree.close_all()
			end,
		},
	},

	filesystem = {
		window = {
			mappings = {
				["o"] = "system_open",
			},
		},
		commands = {
			system_open = function(state)
				local node = state.tree:get_node()
				local path = node:get_id()
				vim.api.nvim_command(string.format("silent !xdg-open '%s'", path))
			end,
		},
		filtered_items = {
			hide_dotfiles = false,
			hide_gitignored = false,
		},
		never_show = {
			".DS_Store",
			"thumbs.db",
		},
		never_show_by_pattern = {
			".null-ls_*",
		},
	},
})
