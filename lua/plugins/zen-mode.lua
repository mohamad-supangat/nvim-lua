return {
    "folke/zen-mode.nvim",
    cmd = { "ZenMode" },
    keys = {
        { "<C-z>", ":ZenMode<CR>", noremap = true, silent = true },
    },
    opts = {
        {
            window = {
                backdrop = 0.95, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
                width = 1, -- width of the Zen window
                height = 1, -- height of the Zen window
                options = {
                    -- signcolumn = "no", -- disable signcolumn
                    -- number = false, -- disable number column
                    -- relativenumber = false, -- disable relative numbers
                    -- cursorline = false, -- disable cursorline
                    -- cursorcolumn = false, -- disable cursor column
                    -- foldcolumn = "0", -- disable fold column
                    -- list = false, -- disable whitespace characters
                },
            },
            plugins = {
                options = {
                    enabled = true,
                    ruler = false,
                    showcmd = false,
                    laststatus = 0, -- turn off the statusline in zen mode
                },
                twilight = { enabled = false }, -- enable to start Twilight when zen mode opens
                gitsigns = { enabled = false }, -- disables git signs
                tmux = { enabled = true },
                kitty = {
                    enabled = false,
                    font = "+4", -- font size increment
                },
                alacritty = {
                    enabled = false,
                    font = "14", -- font size
                },
                wezterm = {
                    enabled = false,
                    font = "+4",
                },
            },
        },
    },
}
