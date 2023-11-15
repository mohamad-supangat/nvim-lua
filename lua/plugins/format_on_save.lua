local status_ok, format_on_save = pcall(require, "format-on-save")
if not status_ok then
	return
end

local formatters = require("format-on-save.formatters")

format_on_save.setup({
	exclude_path_patterns = {
		"/node_modules/",
		".local/share/nvim/lazy",
	},
	formatter_by_ft = {
		css = formatters.lsp,
		html = formatters.lsp,
		dart = formatters.lsp,
		javascript = formatters.lsp,
		json = formatters.lsp,
		lua = formatters.lsp,
		markdown = formatters.lsp,
		openscad = formatters.lsp,
		python = formatters.lsp,
		php = formatters.lsp,
		scss = formatters.lsp,
		-- sh = formatters.shfmt,
		terraform = formatters.lsp,
		-- typescript = formatters.prettierd,
		-- typescriptreact = formatters.prettierd,
		yaml = formatters.lsp,
	},

	-- Optional: fallback formatter to use when no formatters match the current filetype
	fallback_formatter = {
		formatters.remove_trailing_whitespace,
		formatters.prettierd,
	},

	-- By default, all shell commands are prefixed with "sh -c" (see PR #3)
	-- To prevent that set `run_with_sh` to `false`.
	run_with_sh = false,
})
