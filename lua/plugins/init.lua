local variables = require("variables")
vim.g.polyglot_disabled = variables.filetypes

return {
    "sheerun/vim-polyglot",
    { "lewis6991/gitsigns.nvim", opts = {} },
}
