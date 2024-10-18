return {
    "rebelot/kanagawa.nvim",
    lazy = false,
    enabled = true,
    config = function()
        vim.cmd([[set background=dark]])
        require("kanagawa").setup({
            compile = false,  -- enable compiling the colorscheme
            undercurl = true, -- enable undercurls
            -- commentStyle = { italic = true },
            -- functionStyle = { bold = true },
            -- keywordStyle = { italic = true },
            -- statementStyle = { bold = true },
            -- typeStyle = { italic = true },
            transparent = false,   -- do not set background color
            dimInactive = false,   -- dim inactive window `:h hl-NormalNC`
            terminalColors = true, -- define vim.g.terminal_color_{0,17}
            theme = "dragon",      -- Load "wave" theme when 'background' option is not set
            background = {         -- map the value of 'background' option to a theme
                dark = "dragon",   -- try "dragon" !
                light = "lotus",
            },
        })

        vim.cmd([[colorscheme kanagawa]])
    end,
}
