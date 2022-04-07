-----------------------------------------------
----- toglle terminal
-----------------------------------------------

local map = vim.api.nvim_set_keymap
local default_opts = {noremap = true, silent = true}
require("toggleterm").setup {
    -- size can be a number or function which is passed the current terminal
    size = function(term)
        if term.direction == "horizontal" then
            return 15
        elseif term.direction == "vertical" then
            return vim.o.columns * 0.2
        end
    end,
    start_in_insert = true,
    insert_mappings = true, -- whether or not the open mapping applies in insert mode
    terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
    persist_size = false,
    direction = "vertical",
    close_on_exit = true, -- close the terminal window when the process exits
    shell = vim.o.shell -- change the default shell
}

local Terminal = require("toggleterm.terminal").Terminal

local lazygit = Terminal:new({cmd = "lazygit", hidden = true, direction = "float"})
function _lazygit_toggle()
    lazygit:toggle()
end

local term1 = Terminal:new({hidden = true, direction = "float"})
function _term1_toggle()
    term1:toggle()
end

local term2 = Terminal:new({hidden = true, direction = "horizontal"})
function _term2_toggle()
    term2:toggle()
end

local term3 = Terminal:new({hidden = true, direction = "vertical"})
function _term3_toggle()
    term3:toggle()
end


-----------------------------------------------
----- Keymaps
-----------------------------------------------

function _G.set_terminal_keymaps()
    local opts = {noremap = true}
    map("t", "<esc>", [[<C-\><C-n>]], opts)
    map("t", "jk", [[<C-\><C-n>]], opts)
    map("t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
    map("t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
    map("t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
    map("t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
end
vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

map("n", "<leader>git", "<cmd>lua _lazygit_toggle()<CR>", default_opts)

map("n", "<A-i>", "<cmd>lua _term1_toggle()<CR>", default_opts)
map("t", "<A-i>", "<C-\\><C-n><cmd>lua _term1_toggle()<CR>", default_opts)

map("n", "<F1>", "<cmd>lua _term2_toggle()<CR>", default_opts)
map("t", "<F1>", "<C-\\><C-n><cmd>lua _term2_toggle()<CR>", default_opts)


map("n", "<F2>", "<cmd>lua _term3_toggle()<CR>", default_opts)
map("t", "<F2>", "<C-\\><C-n><cmd>lua _term3_toggle()<CR>", default_opts)
