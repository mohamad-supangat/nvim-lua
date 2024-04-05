local variables = require("variables")
vim.g.polyglot_disabled = variables.filetypes

return {
    "sheerun/vim-polyglot",
    { "lewis6991/gitsigns.nvim", opts = {} },
    {
        "mistricky/codesnap.nvim",
        build = "make",
        opts = {
            has_breadcrumbs = true,
            watermark = nill,
            mac_window_bar = false,
        },
    },
}
