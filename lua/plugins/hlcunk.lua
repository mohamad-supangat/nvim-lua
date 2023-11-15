-- { "shellRaining/hlchunk.nvim" }

local status_ok, indentline = pcall(require, "hlchunk")
if not status_ok then
    return
end
local ft = require('hlchunk.utils.filetype')

vim.opt.list = true
-- vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")

local excludes = vim.tbl_extend("force", ft.exclude_filetypes, {
    terminal = true,
    startify = true,
    FTerm = true,
    ["no-profile"] = true,
})

-- vim.cmd([[highlight IndentBlanklineIndent1 guifg=#666666 gui=nocombine]])
indentline.setup({
    indent = {
        chars = { "│", },
        exclude_filetypes = excludes
    },
    chunk = {
        enable = false,
        use_treesitter = true,
        -- support_filetypes = exclude,
        exclude_filetypes = excludes
    },
    line_num = {
        enable = true,
    },
    blank = {
        enable = false,
    }
})
