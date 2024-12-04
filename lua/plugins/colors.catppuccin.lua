return {
    "catppuccin/nvim",
    name = "catppuccin",
    enabled = false,
    lazy = false,
    priority = 1000,
    config = function()
        require("catppuccin").setup({
            background = {
                light = "latte",
                dark = "mocha",
            },

            transparent_background = false,
            show_end_of_buffer = false,
            integration_default = false,
            integrations = {
                barbecue = { dim_dirname = true, bold_basename = true, dim_context = false, alt_background = false },
                cmp = true,
                gitsigns = true,
                hop = true,
                illuminate = { enabled = true },
                native_lsp = { enabled = true, inlay_hints = { background = true } },
                neogit = true,
                neotree = true,
                semantic_tokens = true,
                treesitter = true,
                treesitter_context = true,
                vimwiki = true,
                which_key = true,
            },
            highlight_overrides = {
                latte = function(colors)
                    return {
                        IblIndent = { fg = colors.mantle },
                        IblScope = { fg = colors.surface1 },

                        LineNr = { fg = colors.surface1 },
                    }
                end,
            },
        })

        vim.opt.background = "light"
        vim.api.nvim_command("colorscheme catppuccin")
    end,
}
