return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamoman/mason-lspconfig.nvim",
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
}
