vim.opt.list = true
-- vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")

local exclude = {
    "terminal",
    "startify",
    "nvim-tree",
    "CHADTree",
    "chad-tree",
    "no-profile",
    "alpha",
    "coc-explorer",
    "Starter",
    "starter",
    "FTermm",
}

return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    enabled = false,
    event = "VeryLazy",
    opts = {
        indent = {
            char = "▏",
        },
        exclude = {
            filetypes = exclude,
        },
        -- scope = {
        --     char = "▎",
        -- },
        -- scope = {
        -- show_start = false,
        -- show_end = false,
        -- },
        scope = {
            enabled = false,
        },
    },

    config = function(_, opts)
        require("ibl").setup(opts)
        local hooks = require("ibl.hooks")
        hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
        hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)
    end,
}
