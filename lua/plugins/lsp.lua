return {
    {
        "neovim/nvim-lspconfig",
        enabled = false,
        dependencies = {
            { "folke/trouble.nvim", dependencies = "nvim-tree/nvim-web-devicons" },
            -- "lukas-reineke/lsp-format.nvim"
        },

        config = function()
            require('lsp')
        end
    },
    -- {
    --     "creativenull/efmls-configs-nvim",
    --     dependencies = { "neovim/nvim-lspconfig" },
    -- },
    {
        "williamboman/mason.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        "williamboman/mason-lspconfig.nvim",
        enabled = false,
    },


    {
        "jay-babu/mason-null-ls.nvim",
        enabled = false,
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "williamboman/mason.nvim",
            "nvimtools/none-ls.nvim",
        },
        config = function()
            require('lsp.null-ls')
        end,
    },

    -- "MunifTanjim/prettier.nvim"
}
