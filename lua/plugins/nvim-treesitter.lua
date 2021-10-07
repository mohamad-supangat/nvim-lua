-----------------------------------------------------------
-- Treesitter configuration file
-----------------------------------------------------------

-- Plugin: nvim-treesitter
--- https://github.com/nvim-treesitter/nvim-treesitter
require("nvim-treesitter.configs").setup {
    ensure_installed = "maintained",
    indent = {
        enable = true
    },
    autotag = {
        enable = true,
        filetypes = { "html" , "xml" },
    },
    matchup = {
        enable = true, -- mandatory, false will disable the whole extension
        disable = {"c", "ruby"} -- optional, list of language that will be disabled
    },
    highlight = {
        enable = true, -- false will disable the whole extension
        disable = {"c", "rust"} -- list of language that will be disabled
    },
    rainbow = {
        enable = true,
        extended_mode = true -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
        -- max_file_lines = 1000, -- Do not enable for files with more than 1000 lines, int
    }
}
