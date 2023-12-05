local status_ok, fzf_lua = pcall(require, "fzf-lua")
if not status_ok then
    return
end

local map = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }

-- Fzf lua
map("", "<C-p>", ":lua require('fzf-lua').files()<CR>", default_opts) -- file search
map("n", "<leader>fzf", ":FzfLua<CR>", default_opts)                  -- open fzf menu
map("n", "<leader>P", ":FzfLua commands<CR>", default_opts)           -- open fzf menu

local actions = require("fzf-lua.actions")
require("fzf-lua").setup({
    files = {
        previewer   = "",
        prompt      = "Files  ❯ ",
        -- cmd = 'ag --hidden -U -g "" --ignore-dir={vendor,node_modules,.git}',
        cmd         =
        "rg --files --ignore-case --hidden -uu -g '!/**/.git' -g '!/**/cache*/' -g '!/**/node_modules' -g '!/vendor' -g '!*.{jpg,jpeg,png,gif,bmp,tiff,mov,mp4,avi,mpeg,webm}'",
        git_icons   = true, -- show git icons?
        file_icons  = true, -- show file icons?
        color_icons = true, -- colorize file|git icons
        actions     = {
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
