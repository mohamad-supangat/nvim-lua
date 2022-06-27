vim.opt.list = true
-- vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")

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
    "starter"
}

vim.cmd [[highlight IndentBlanklineIndent1 guifg=#6F6F6F gui=nocombine]]
require("indent_blankline").setup {
    -- space_char_blankline = "|",
    -- space_char_blankline = " ",
    char = "▏",
    show_current_context = true,
    show_current_context_start = true,
    buftype_exclude = exclude,
    filetype_exclude = exclude,
    show_end_of_line = true,
    char_highlight_list = {
        "IndentBlanklineIndent1"
    }
}
