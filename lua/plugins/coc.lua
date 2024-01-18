-----------------------------------------------------------
-- Neovim API aliases
-----------------------------------------------------------
--local map = map  -- set global keymap
vim.g.coc_global_extensions = { 'coc-json', 'coc-marketplace', 'coc-snippets', 'coc-lua', 'coc-prettier', 'coc-explorer',
    'coc-pairs', 'coc-emmet' }

return {
    'neoclide/coc.nvim',
    enabled = false,
    branch = 'release',
    dependencies = {
        "nvim-tree/nvim-web-devicons"
    },
    keys = {
        -- coc multiple cursor
        { mode = 'n', "<leader>c",   "<Plug>(coc-cursors-position)" },
        { mode = 'n', "<leader>d",   "<Plug>(coc-cursors-word)" },
        { mode = 'x', "<leader>d",   "<Plug>(coc-cursors-range)" },
        { mode = 'n', "<leader>x",   "<Plug>(coc-cursors-operator)" },


        -- coc-explorer
        { mode = "n", "<C-n>",       ":CocCommand explorer<CR>" },


        { mode = "n", "<leader>.",   "<Plug>(coc-codeaction)" },
        { mode = "n", "<leader>l",   ":CocCommand eslint.executeAutofix<CR>" },
        { mode = "n", "gd",          "<Plug>(coc-definition)",                    silent = true },
        { mode = "n", "K",           ":call CocActionAsync('doHover')<CR>",       silent = true, noremap = true },
        { mode = "n", "<leader>rn",  "<Plug>(coc-rename)" },


        -- snippets
        -- { mode = "i", "<leader>s", "<Plug>(coc-snippets-expand)"},
        { mode = "x", "<leader>x",   "<Plug>(coc-convert-snippet)" },
        -- { mode = "v", "<leader>ss", "<Plug>(coc-snippets-select)"},

        -- formater command
        { mode = "n", "<leader>f",   ":call CocActionAsync('format')<CR>" },
        { mode = "x", "<leader>f",   " <Plug>(coc-format-selected)<CR>" },
        { mode = "v", "<leader>f",   " <Plug>(coc-format-selected)<CR>" },


        -- diagnostic
        { mode = "n", "[g",          "<Plug>(coc-diagnostic-prev)" },
        { mode = "n", "]g",          "<Plug>(coc-diagnostic-next)" },
        { mode = "n", "<leader>xx",  "<cmd>CocDiagnostic<cr>" },
        { mode = "n", "gl",          ":call CocActionAsync('diagnosticInfo')<CR>" },

        -- show list in fzf
        { mode = "n", "<leader>coc", ":CocList<CR>" },
        { mode = "n", "<leader>P",   ":CocList commands<CR>" },


        { mode = "i", "<C-space>",   "coc#refresh()",                             silent = true, expr = true },

        {
            mode = "i",
            "<TAB>",
            "coc#pum#visible() ? coc#pum#next(1) : '<TAB>'",
            noremap = true,
            silent = true,
            expr = true
        },

        {
            mode = "i",
            "<S-TAB>",
            "coc#pum#visible() ? coc#pum#prev(1) : '<C-h>'",
            noremap = true,
            silent = true,
            expr = true
        },

        {
            mode = "i",
            "<C-j>",
            "coc#pum#visible() ? coc#pum#next(1) : '<C-j>'",
            noremap = true,
            silent = true,
            expr = true
        },

        {
            mode = "i",
            "<C-k>",
            "coc#pum#visible() ? coc#pum#prev(1) : '<C-k>'",
            noremap = true,
            silent = true,
            expr = true
        },

        -- {
        --     mode = "i",
        --     "<down>",
        --     "coc#pum#visible() ? coc#pum#next(1) : '<down>'",
        --     noremap = true,
        --     silent = true,
        --     expr = true
        -- },
        --
        -- {
        --     mode = "i",
        --     "<up>",
        --     "coc#pum#visible() ? coc#pum#prev(1) : '<up>'",
        --     noremap = true,
        --     silent = true,
        --     expr = true
        -- },

        {
            mode = "i",
            "<CR>",
            "coc#pum#visible() ? coc#pum#confirm() : '<C-G>u<CR><C-R>=coc#on_enter()<CR>'",
            silent = true,
            expr = true,
            noremap = true
        },

        { mode = "n", "<f7>", "<cmd>CocOutline<cr>" },
    }
}
