-- vim.opt.list = true
-- vim.opt.listchars:append("space:⋅")
-- vim.opt.listchars:append("eol:↴")

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
    "FTermm"
}

return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    enabled = false,
    -- opts = {
    --     indent = {
    --         char = "▏",
    --     },
    --     exclude = {
    --         filetypes = exclude,
    --     },
    --     scope = {
    --         enabled = false
    --     }
    --     -- show_end_of_line = true,
    --     -- char_highlight_list = {
    --     --     "IndentBlanklineIndent1"
    --     -- }
    -- },
    config = function()
        local highlight = {
            "RainbowRed",
            "RainbowYellow",
            "RainbowBlue",
            "RainbowOrange",
            "RainbowGreen",
            "RainbowViolet",
            "RainbowCyan",
        }

        local hooks = require "ibl.hooks"
        -- create the highlight groups in the highlight setup hook, so they are reset
        -- every time the colorscheme changes
        hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
            vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#906C75" })
            vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#95C07B" })
            vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#617F9F" })
            vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
            vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
            vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
            vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
        end)

        require("ibl").setup { indent = { highlight = highlight, char = "▏",
        },
            exclude = {
                filetypes = exclude,
            },
            scope = {
                enabled = false
            },
        }
    end
}
