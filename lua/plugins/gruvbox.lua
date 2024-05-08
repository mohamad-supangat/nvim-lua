return {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    enabled = false,
    priority = 1000,
    config = function(config)
        require("gruvbox").setup({
            terminal_colors = true,
            transparent_mode = true,
            bold = true,
            italic = {
                strings = true,
                emphasis = true,
                comments = true,
                operators = false,
                folds = true,
                keywords = true,
                types = true,
            },
        })
        vim.cmd([[colorscheme gruvbox]])
    end,
}
