local status_ok, nightfox = pcall(require, "nightfox")
if not status_ok then
	return
end

vim.g.nightfox_flavour = "frappe" -- latte, frappe, macchiato, mocha

nightfox.setup({
	options = {
		terminal_colors = true,
		styles = {
			comments = "italic",
			keywords = "bold",
			types = "italic,bold",
		},
	},
})

vim.cmd([[colorscheme carbonfox]])
