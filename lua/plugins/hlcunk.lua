local status_ok, indentline = pcall(require, "hlchunk")
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
        chars = { "│", },
    },
    chunk = {
        enable = true,
        use_treesitter = true,
        -- support_filetypes = exclude,
        -- exclude_filetypes = exclude
    },
    line_num = {
        enable = true,
    },
    blank = {
        enable = false,
    }
})
