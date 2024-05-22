local variables = require("variables")
vim.g.polyglot_disabled = variables.filetypes

return {
    "sheerun/vim-polyglot",
    -- {
    --     "nmac427/guess-indent.nvim",
    --     opts = {},
    -- },
    {
        "vidocqh/auto-indent.nvim",
        opts = {},
    },
}
