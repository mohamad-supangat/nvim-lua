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
    "starter",
    "FTermm"
}
vim.cmd.highlight("default link IndentLine Comment")
return {
    'nvimdev/indentmini.nvim',
    event = 'BufEnter',
    enabled = true,
    opts = {
        char = "▏",
        exclude = exclude,
        scope = {
            enabled = false
        }
        -- show_end_of_line = true,
        -- char_highlight_list = {
        --     "IndentBlanklineIndent1"
        -- }
    }
}
