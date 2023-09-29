local status_ok, indentline = pcall(require, "ibl")
if not status_ok then
    return
end
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
}

-- vim.cmd([[highlight IndentBlanklineIndent1 guifg=#666666 gui=nocombine]])
indentline.setup({
    indent = {
        char = "▏",
    },
    exclude = {
        language = exclude,
    }
    -- show_end_of_line = true,
    -- char_highlight_list = {
    --     "IndentBlanklineIndent1"
    -- }
})
