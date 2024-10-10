return {
    "saghen/blink.cmp",
    enabled = false,
    event = { "LspAttach", "InsertCharPre" },
    version = "v0.*",
    opts = {
        highlight = {
            use_nvim_cmp_as_default = true,
        },
        nerd_font_variant = "normal",
        accept = { auto_brackets = { enabled = true } },

        -- trigger = { signature_help = { enabled = true } },

        keymap = {
            show = "<C-space>",
            hide = { "<C-d>" },
            accept = { "<CR>", "<Tab>" },
            select_prev = { "<Up>", "<C-p>", "<C-k>" },
            select_next = { "<Down>", "<C-n>", "<C-j>" },
            show_documentation = {},
            hide_documentation = {},
            scroll_documentation_up = "<C-y>",
            scroll_documentation_down = "<C-e>",
        },

        windows = {
            autocomplete = {
                border = "rounded",
            },
            documentation = {
                border = "rounded",
            },
        },
    },
}
