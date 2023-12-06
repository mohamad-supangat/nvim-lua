return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function(config)
        require('tokyonight').setup({
            style = 'night',
            transparent = true,
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
    end
}
