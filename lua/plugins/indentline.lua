-- vim.opt.list = true
-- vim.opt.listchars:append("space:⋅")
-- vim.opt.listchars:append("eol:↴")

local exclude = {
    "terminal",
    "startify",
    "nvim-tree",
    "CHADTree",
    "chad-tree",
    "no-profile",
    "alpha",
    "coc-explorer",
    "Starter",
    "starter",
    "FTermm"
}

return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    enabled = true,
    opts = {
        indent = {
            -- char = "▏",
        },
        exclude = {
            filetypes = exclude,
        },
        scope = {
            enabled = false
        }
        -- show_end_of_line = true,
        -- char_highlight_list = {
        --     "IndentBlanklineIndent1"
        -- }
    }
}
