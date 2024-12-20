return {
    "folke/tokyonight.nvim",
    lazy = false,
    enabled = false,
    priority = 1000,
    config = function(config)
        require("tokyonight").setup({
            style = "night",
            transparent = false,
            styles = {
                comments = { italic = true },
                properties = { italic = true },
                functions = { bold = true },
                keywords = { italic = true },
                operators = { bold = true },
                conditionals = { bold = true, italic = true },
                loops = { bold = true },
                booleans = { bold = true, italic = true },
                numbers = { italic = true },
                types = { italic = true },
                strings = { italic = true },
                variables = {},
                sidebars = "transparent",
                floats = "transparent",
            },
            -- day_brightness = 0.3,
        })
        vim.cmd([[colorscheme tokyonight]])
    end,
}
