vim.opt.list = true
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")

require("indent_blankline").setup {
    space_char_blankline = " ",
    char = '▏',
    show_current_context = false,
    buftype_exclude = {"terminal", 'startify', 'nvim-tree'},
    show_end_of_line = true,
}
