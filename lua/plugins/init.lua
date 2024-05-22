local variables = require("variables")
vim.g.polyglot_disabled = variables.filetypes

return {
    "sheerun/vim-polyglot",
    {
        "mistricky/codesnap.nvim",
        build = "make",
        opts = {
            has_breadcrumbs = true,
            watermark = nill,
            mac_window_bar = false,
        },
    },
    -- {
    --     "nmac427/guess-indent.nvim",
    --     opts = {},
    -- },
    {
        "vidocqh/auto-indent.nvim",
        opts = {},
    },
}
