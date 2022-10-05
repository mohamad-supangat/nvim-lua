vim.g.catppuccin_flavour = "frappe" -- latte, frappe, macchiato, mocha

require("catppuccin").setup({
    transparent_background = true,
    term_colors = false,
    dim_inactive = {enabled = false, shade = "dark", percentage = 0.15},
    styles = {
        comments = {"italic"},
        conditionals = {"italic"},
        loops = {},
        functions = {"italic"},
        keywords = {},
        strings = {},
        variables = {"italic"},
        numbers = {"bold"},
        booleans = {},
        properties = {},
        types = {},
        operators = {}
    },
    integrations = {
        treesitter = true,
        cmp = true,
        gitsigns = true,
        symbols_outline = true,
        neotree = true,
        mini = true,
        ts_rainbow = true,
        indent_blankline = {enabled = true, colored_indent_levels = false}
        -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
    },
    color_overrides = {},
    highlight_overrides = {}
})

vim.cmd [[colorscheme catppuccin]]
