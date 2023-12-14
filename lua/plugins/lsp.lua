return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            { "folke/trouble.nvim", dependencies = "nvim-tree/nvim-web-devicons" },
            -- "lukas-reineke/lsp-format.nvim"
        },

        config = function()
            require('lsp')
        end
    },
    {
        "creativenull/efmls-configs-nvim",
        dependencies = { "neovim/nvim-lspconfig" },
    },
    {
        "williamboman/mason.nvim",
    },

    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim"
}
