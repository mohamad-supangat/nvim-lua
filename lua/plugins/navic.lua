return {
    "SmiteshP/nvim-navic",
    opts = {
        -- icons = {
        --     File          = "󰈙 "
        --     Module        = " ",
        --     Namespace     = "󰌗 ",
        --     Package       = " ",
        --     Class         = "󰌗 ",
        --     Method        = "󰆧 ",
        --     Property      = " ",
        --     Field         = " ",
        --     Constructor   = " ",
        --     Enum          = "󰕘",
        --     Interface     = "󰕘",
        --     Function      = "󰊕 ",
        --     Variable      = "󰆧 ",
        --     Constant      = "󰏿 ",
        --     String        = "󰀬 ",
        --     Number        = "󰎠 ",
        --     Boolean       = "◩ ",
        --     Array         = "󰅪 ",
        --     Object        = "󰅩 ",
        --     Key           = "󰌋 ",
        --     Null          = "󰟢 ",
        --     EnumMember    = " ",
        --     Struct        = "󰌗 ",
        --     Event         = " ",
        --     Operator      = "󰆕 ",
        --     TypeParameter = "󰊄 ",
        -- },
        icons = {
            File          = "",
            Module        = "",
            Namespace     = "",
            Package       = "",
            Class         = "",
            Method        = "",
            Property      = "",
            Field         = "",
            Constructor   = "",
            Enum          = "",
            Interface     = "",
            Function      = "",
            Variable      = "",
            Constant      = "",
            String        = "",
            Number        = "",
            Boolean       = "",
            Array         = "",
            Object        = "",
            Key           = "",
            Null          = "",
            EnumMember    = "",
            Struct        = "",
            Event         = "",
            Operator      = "",
            TypeParameter = "",
        },
        lsp = {
            auto_attach = true,
            preference = nil,
        },
        highlight = false,
        -- separator = "  ",
        separator = " > ",
        depth_limit = 6,
        depth_limit_indicator = "…",
        safe_output = false,
        lazy_update_context = false,
        click = true,
        format_text = function(text)
            return text
        end,
    }
}
