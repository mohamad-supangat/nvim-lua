return {
    "nvimdev/guard.nvim",
    -- Builtin configuration, optional
    --
    enabled = false,
    dependencies = {
        "nvimdev/guard-collection",
    },

    keys = {
        {
            "<leader>fm",
            "<cmd>GuardFmt<cr>",
            noremap = true,
            silent = true,
            desc = "Format Buffer",
        },
    },

    config = function()
        local ft = require("guard.filetype")

        ft("lua"):fmt("lsp"):append("stylua")
        ft("php"):fmt({
            cmd = "php-cs-fixer",
            args = { "fix", "--config", "/home/deve/.config/nvim/configs/php-cs-fixer.php" },
            stdin = true,
            fname = true
        })


        -- Call setup() LAST!
        require("guard").setup({
            -- Choose to format on every write to a buffer
            fmt_on_save = true,
            -- Use lsp if no formatter was defined for this filetype
            lsp_as_default_formatter = true,
            -- By default, Guard writes the buffer on every format
            -- You can disable this by setting:
            -- save_on_fmt = false,
        })
    end,
}
