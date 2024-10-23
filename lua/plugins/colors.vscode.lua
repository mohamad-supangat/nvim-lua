return {
    "Mofiqul/vscode.nvim",
    enabled = false,
    config = function()
        require('vscode').setup({});
        vim.cmd.colorscheme('vscode')
    end
}
