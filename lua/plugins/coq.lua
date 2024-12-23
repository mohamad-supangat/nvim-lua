return {
    "ms-jpq/coq_nvim",
    branch = "coq",
    enabled = false,
    build = function()
        vim.cmd('COQdeps')
    end,
    lazy = true,
    cmd = {
        'COQhelp',
        'COQnow',
        'COQdeps',
    },
    event = { 'LspAttach', 'User LazyInsertEnter', 'CmdlineEnter' },
    dependencies = {
        { "ms-jpq/coq.artifacts", branch = "artifacts" },
        {
            'ms-jpq/coq.thirdparty',
            branch = "3p",
            config = function()
                require("coq_3p") {
                    { src = "nvimlua", short_name = "nLUA" },
                    { src = "codeium", short_name = "COD" },
                    { src = 'demo' }
                }
            end
        },
        {
            'pze/coq_luasnip',
            dependencies = {
                'L3MON4D3/LuaSnip',
            },
        },
        {
            "Exafunction/codeium.vim",
            init = function()
                -- vim.g.codeium_render = true
                -- vim.g.codeium_enabled = true
                -- vim.g.codeium_manual = true
                -- vim.g.codeium_disable_bindings = 1
            end
        }
    },
    init = function()
        vim.g.coq_settings = {
            auto_start = 'shut-up',
            keymap = {
                recommended = false,
                jump_to_mark = "",
                bigger_preview = ""
            },
            display = {
                ghost_text = {
                    context = { ' ', '' },
                },
                pum = {
                    fast_close = false,
                },
                preview = {
                    enabled = true,
                    border = 'single',
                    positions = { north = 2, south = 3, west = 4, east = 1 },
                },
                mark_applied_notify = false,
            },
            -- https://github.com/ms-jpq/coq_nvim/blob/coq/docs/FUZZY.md
            weights = {
                prefix_matches = 2,
            },
            clients = {
                lsp = {
                    resolve_timeout = 0.04,
                    weight_adjust = 1,
                },

                snippets = {
                    -- use coq luasnip
                    enabled = false,
                    user_path = vim.fn.stdpath('config') .. '/snippets',
                },
            },
            completion = {
                skip_after = { '\\', '/', '*', '=', '..', ')', '(', "'", '"', ';', ',', ':', '[', ']', '{', '}', ' ', '`' },
            },
        }
    end,
    config = function()
        vim.api.nvim_set_keymap('i', '<Esc>', [[pumvisible() ? "\<C-e><Esc>" : "\<Esc>"]], { expr = true, silent = true })
        vim.api.nvim_set_keymap('i', '<C-c>', [[pumvisible() ? "\<C-e><C-c>" : "\<C-c>"]], { expr = true, silent = true })
        vim.api.nvim_set_keymap('i', '<BS>', [[pumvisible() ? "\<C-e><BS>" : "\<BS>"]], { expr = true, silent = true })
        vim.api.nvim_set_keymap(
            "i",
            "<CR>",
            [[pumvisible() ? (complete_info().selected == -1 ? "\<C-e><CR>" : "\<C-y>") : "\<CR>"]],
            { expr = true, silent = true }
        )
        vim.api.nvim_set_keymap('i', '<Tab>', [[pumvisible() ? "\<C-n>" : "\<Tab>"]], { expr = true, silent = true })
        vim.api.nvim_set_keymap('i', '<S-Tab>', [[pumvisible() ? "\<C-p>" : "\<BS>"]], { expr = true, silent = true })
        vim.api.nvim_set_keymap('i', '<C-k>', [[pumvisible() ? "\<C-p>" : "\<C-k>"]], { expr = true, silent = true })
        vim.api.nvim_set_keymap('i', '<C-j>', [[pumvisible() ? "\<C-n>" : "\<C-j>"]], { expr = true, silent = true })
    end,
}
