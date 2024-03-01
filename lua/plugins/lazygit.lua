return {
    "kdheepak/lazygit.nvim",
    -- event = "VeryLazy",
    cmd = { 'LazyGitCurrentFile' },
    keys = {
        {
            "<leader>g",
            ":LazyGitCurrentFile<CR>",
            noremap = true,
            silent = true,
            desc = "Open lazygit"
        }
    }
}
