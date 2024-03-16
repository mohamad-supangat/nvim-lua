return {
    "kdheepak/lazygit.nvim",
    -- event = "VeryLazy",
    cmd = { "LazyGitCurrentFile" },
    keys = {
        {
            "<leader>gi",
            ":LazyGitCurrentFile<CR>",
            noremap = true,
            silent = true,
            desc = "Open lazygit",
        },
    },
}
