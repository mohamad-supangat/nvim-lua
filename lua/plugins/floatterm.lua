local status_ok, fterm = pcall(require, "term")
if not status_ok then return end

require("term").setup({
    shell = vim.o.shell,
    width = 0.8,
    height = 0.9,
    anchor = "NW",
    position = "center",
    title = {
        align = "center", -- left, center or right
    },
    border = {
        chars = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
        hl = "TermBorder",
    },
})


vim.keymap.set({ 't' }, '<C-t>', require('term').new, { silent = true })
vim.keymap.set({ 'n', 't' }, '<A-i>', require('term').toggle, { silent = true })
vim.keymap.set({ 't' }, '<F2>', require('term').next, { silent = true })
vim.keymap.set({ 't' }, '<F1>', require('term').prev, { silent = true })
