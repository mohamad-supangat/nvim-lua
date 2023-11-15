local status_ok, tokyonight = pcall(require, "tokyonight")
if not status_ok then
    return
end



local transparent_background = true
local clear = {}

tokyonight.setup({
    style = 'night',
    transparent = transparent_background,
    styles = {
        comments = { italic = true },
        properties = { italic = true },
        functions = { bold = true },
        keywords = { italic = true },
        operators = { bold = true },
        conditionals = { bold = true },
        loops = { bold = true },
        booleans = { bold = true, italic = true },
        numbers = {},
        types = {},
        strings = {},
        variables = {},
        sidebars = 'transparent',
        floats = 'transparent'
    },
    day_brightness = 0.3,
})
vim.cmd [[colorscheme tokyonight]]
