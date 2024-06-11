return {
    "ibhagwan/fzf-lua",
    config = function()
        local fzf_lua = require("fzf-lua")
        local map = vim.api.nvim_set_keymap
        local default_opts = { noremap = true, silent = true }

        vim.keymap.set("", "<C-p>", ":lua require('fzf-lua').files()<CR>", default_opts) -- file search
        vim.keymap.set("", "<C-m>", ":lua require('fzf-lua').buffers()<CR>", default_opts) -- file search
        -- vim.keymap.set("n", "<leader>fzf", ":FzfLua<CR>", default_opts)                  -- open fzf menu
        -- vim.keymap.set("n", "<leader>P", ":FzfLua commands<CR>", default_opts)           -- open fzf menu

        local actions = require("fzf-lua.actions")
        fzf_lua.setup({
            buffers = {
                previewer = false,
                git_icons = true,
                file_icons = false,
                color_icons = false,
            },
            files = {
                previewer = false,
                prompt = "Cari File  ❯ ",
                -- cmd = 'ag --hidden -U -g "" --ignore-dir={vendor,node_modules,.git}',
                cmd = "rg --files --ignore-case --hidden -uu -g '!/**/.git' -g '!/**/cache*/' -g '!/**/node_modules' -g '!/vendor' -g '!*.{jpg,jpeg,png,gif,bmp,tiff,mov,mp4,avi,mpeg,webm}'",
                git_icons = true,
                file_icons = false,
                color_icons = false,
                actions = {
                    -- set bind to 'false' to disable
                    ["default"] = actions.file_edit,
                    ["ctrl-s"] = actions.file_split,
                    ["ctrl-v"] = actions.file_vsplit,
                    ["ctrl-t"] = actions.file_tabedit,
                    ["alt-q"] = actions.file_sel_to_qf,
                    -- custom actions are available too
                    ["ctrl-y"] = function(selected)
                        print(selected[2])
                    end,
                },
            },
        })
    end,
}
