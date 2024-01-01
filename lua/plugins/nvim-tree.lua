return {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
        "nvim-tree/nvim-web-devicons"
    },
    config = function()
        local map = vim.api.nvim_set_keymap
        -- local tree_cb = require("nvim-tree.config").nvim_tree_callback
        local default_opts = { noremap = true, silent = true }

        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        map("n", "<C-n>", ":NvimTreeToggle<CR>", default_opts)


        local function my_on_attach(bufnr)
            local api = require "nvim-tree.api"

            local function opts(desc)
                return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
            end

            -- default mappings
            api.config.mappings.default_on_attach(bufnr)

            -- custom mappings
            vim.keymap.set('n', 'l', api.node.open.edit, opts('Edit / Open Node'))
            vim.keymap.set('n', 'h', api.node.navigate.parent_close, opts('Close Node'))
        end

        require('nvim-tree').setup({
            on_attach = my_on_attach,

            sort_by = "case_sensitive",
            git = {
                ignore = false,
            },
            actions = {
                open_file = {
                    quit_on_open = true,
                },
            },
            view = {
                preserve_window_proportions = true,
                adaptive_size = true,
                cursorline = true,
                -- auto_resize = true,
                -- mappings = {
                --     list = {
                --         { key = { "l", "<CR>", "<2-LeftMouse>" }, cb = tree_cb("edit") },
                --         { key = "L",                              cb = tree_cb("cd") },
                --         { key = "<C-s>",                          cb = tree_cb("split") },
                --         { key = "<C-v>",                          cb = tree_cb("vsplit") },
                --         { key = "<C-t>",                          cb = tree_cb("tabnew") },
                --         { key = "h",                              cb = tree_cb("close_node") },
                --         { key = "i",                              cb = tree_cb("preview") },
                --         { key = "R",                              cb = tree_cb("refresh") },
                --         { key = "c",                              cb = tree_cb("create") },
                --         { key = "D",                              cb = tree_cb("remove") },
                --         { key = "r",                              cb = tree_cb("rename") },
                --         { key = "d",                              cb = tree_cb("cut") },
                --         { key = "y",                              cb = tree_cb("copy") },
                --         { key = "p",                              cb = tree_cb("paste") },
                --         { key = "gyn",                            cb = tree_cb("copy_name") },
                --         { key = "gyp",                            cb = tree_cb("copy_path") },
                --         {
                --             key = "gya",
                --             cb = tree_cb("copy_absolute_path"),
                --         },
                --         { key = "H", cb = tree_cb("dir_up") },
                --         { key = "s", cb = tree_cb("system_open") },
                --         { key = "q", cb = tree_cb("close") },
                --     },
                -- },
            },
            renderer = {
                group_empty = true,
            },
            filters = {
                dotfiles = false,
            },
            live_filter = {
                always_show_folders = false,
            },
            update_focused_file = {
                enable = true,
            },
            hijack_cursor = true,
        })
    end
}
