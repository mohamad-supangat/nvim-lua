return {
    "rafamadriz/friendly-snippets",

    -- odoo snippets
    -- "droggol/VscOdooSnippets",

    -- laravel snippets
    -- "onecentlin/laravel5-snippets-vscode",
    -- "onecentlin/laravel-blade-snippets-vscode",
    -- "ahinkle/vscode-laravel-model-snippets",
    "use-the-fork/laravel-vscode-snippets",
    -- "anburocky3/bootstrap5-snippets",
    -- -- quasar snippets
    -- "Abdelaziz18003/vscode-quasar-snippets",
    -- { "mohamad-supangat/snippets" },

    {
        "chrisgrieser/nvim-scissors",
        opts = {
            snippetDir = "/home/deve/projects/snippets",
            jsonFormatter = "jq",
        },
        keys = {
            {
                "<leader>sne",
                function()
                    require("scissors").editSnippet()
                end,
                mode = { "n" },
                noremap = true,
                silent = true,
            },
            {
                "<leader>sna",
                function()
                    require("scissors").addNewSnippet()
                end,
                mode = { "n", "x" },
                noremap = true,
                silent = true,
            },
        },
    },
}
