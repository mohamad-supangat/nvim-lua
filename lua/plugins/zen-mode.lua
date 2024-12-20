return {
    "folke/zen-mode.nvim",
    cmd = { "ZenMode" },
    keys = {
        { "<C-z>", ":ZenMode<CR>", noremap = true, silent = true },
    },
    opts = {
        window = {
            width = 9000,
        },
    },
}
