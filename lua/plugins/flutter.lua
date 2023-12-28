return {
    'akinsho/flutter-tools.nvim',
    enabled = false,
    lazy = false,
    dependencies = {
        'nvim-lua/plenary.nvim',
    },
    opts = {
        ui = {
            border = "rounded",
        },
        widget_guides = {
            enabled = true,
        },
        closing_tags = {
            highlight = "Comment", -- highlight for the closing tag
            prefix = " // ",   -- character to use for close tag e.g. > Widget
            enabled = true,    -- set to false to disable
        },
        dev_log = {
            enabled = true,
            notify_errors = true, -- if there is an error whilst running then notify the user
            open_cmd = "30vnew", -- command to use to open the log buffer
        },
        dev_tools = {
            autostart = true,     -- autostart devtools server if not detected
            auto_open_browser = true, -- Automatically opens devtools in the browser
        },
        outline = {
            open_cmd = "30vnew", -- command to use to open the outline buffer
            auto_open = false, -- if true this will open the outline automatically when it is first populated
        },
        lsp = {
            color = {
                -- show the derived colours for dart variables
                enabled = true, -- whether or not to highlight color variables at all, only supported on flutter >= 2.10
                background = false, -- highlight the background
                -- background_color = nil, -- required, when background is transparent (i.e. background_color = { r = 19, g = 17, b = 24},)
                foreground = false, -- highlight the foreground
                virtual_text = true, -- show the highlight using virtual text
                virtual_text_str = "■", -- the virtual text character to highlight
            },
            on_attach = require("lsp.handlers").on_attach,
            capabilities = require("lsp.handlers").capabilities,
            settings = {
                showTodos = true,
                enableSnippets = true,
                updateImportsOnRename = true, -- Whether to update imports and other directives when files are renamed. Required for `FlutterRename` command.
            },
        },
    }
}
