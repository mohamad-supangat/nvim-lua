local map = vim.api.nvim_set_keymap
local default_opts = {noremap = true, silent = true}

map("n", "<C-n>", ":NeoTreeRevealToggle<CR>", default_opts)

require("neo-tree").setup({
    filesystem = {
        filtered_items = {hide_dotfiles = false, hide_gitignored = false},
        follow_current_file = true,
        window = {
            position = "left",
            mappings = {["l"] = "open", ["h"] = "close_node"}
        }
    }
})
