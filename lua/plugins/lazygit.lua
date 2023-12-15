return {
    "kdheepak/lazygit.nvim",
    config = function()
        vim.keymap.set("n", "<leader>gi", ":LazyGitCurrentFile<CR>",
            { noremap = true, silent = true, desc = "Open lazygit" })
    end
}
