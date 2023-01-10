local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
	return
end

-- local mocha = require("catppuccin.palettes").get_palette "mocha"
bufferline.setup({
	-- highlights = require("catppuccin.groups.integrations.bufferline").get(),
	options = {
		offsets = {
			{ filetype = "neo-tree", text = "File Manager", padding = 1 },
			{ filetype = "NvimTree", text = "File Manager", padding = 1 },
		},
		-- indicator = {
		-- 	stule = "underline",
		-- },

		separator_style = "thin",
		diagnostics = "nvim_lsp",
		color_icons = true,
		-- separator_style = 'slant'
	},
})
