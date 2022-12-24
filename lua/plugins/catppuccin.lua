vim.g.catppuccin_flavour = "frappe" -- latte, frappe, macchiato, mocha

require("catppuccin").setup({
	transparent_background = true,
	term_colors = true,
	dim_inactive = { enabled = false, shade = "dark", percentage = 0.15 },
	styles = {
		comments = { "italic" },
		conditionals = { "italic" },
		loops = {},
		functions = { "italic" },
		keywords = {},
		strings = {},
		variables = { "italic" },
		numbers = { "bold" },
		booleans = {},
		properties = {},
		types = {},
		operators = {},
	},
	integrations = {
		treesitter = true,
		cmp = true,
		gitsigns = true,
		lsp_trouble = true,
		symbols_outline = true,
		nvimtree = true,
		mini = true,
		ts_rainbow = true,
		indent_blankline = { enabled = true, colored_indent_levels = true },
		native_lsp = {
			enabled = true,
			virtual_text = {
				errors = { "italic" },
				hints = { "italic" },
				warnings = { "italic" },
				information = { "italic" },
			},
			underlines = {
				errors = { "underline" },
				hints = { "underline" },
				warnings = { "underline" },
				information = { "underline" },
			},
		},
		-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
	},
	color_overrides = {},
	highlight_overrides = {},
})

vim.cmd([[colorscheme catppuccin]])
