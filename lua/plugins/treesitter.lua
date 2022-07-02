require "nvim-treesitter.configs".setup {
    -- A list of parser names, or "all"
    ensure_installed = {"php", "lua", "vue", "javascript", "json"},
    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,
    -- List of parsers to ignore installing (for "all")
    ignore_install = {},
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = true
    },
    context_commentstring = {
        enable = true
    },
    rainbow = {
        enable = true,
        -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
        extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
        max_file_lines = nil -- Do not enable for files with more than n lines, int
        -- colors = {}, -- table of hex strings
        -- termcolors = {} -- table of colour name strings
    }
}

require("nvim-biscuits").setup(
    {
        default_config = {
            max_length = 12,
            min_distance = 5,
            prefix_string = " 📎 "
        },
        language_config = {
            html = {
                prefix_string = " 🌐 "
            },
            javascript = {
                prefix_string = " ✨ ",
                max_length = 80
            },
            -- python = {
            --     disabled = true
            -- }
        }
    }
)
