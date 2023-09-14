local status_ok, catppuccin = pcall(require, "catppuccin")
if not status_ok then
    return
end

vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha

catppuccin.setup({
    transparent_background = false,
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
        types = { "bold" },
        operators = {},
    },
    integrations = {
        telescope = {
            enabled = false,
            style = "nvchad",
        },
        treesitter = true,
        cmp = true,
        gitsigns = true,
        nvimtree = false,
        window_picker = true,
        mini = true,
        lsp_trouble = true,
        symbols_outline = true,
        notify = true,
        neotree = true,
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
    color_overrides = {
        mocha = {
            base = "#000000",
            mantle = "#000000",
            crust = "#000000",
        },
    },
    highlight_overrides = {},
})

vim.cmd([[colorscheme catppuccin]])
