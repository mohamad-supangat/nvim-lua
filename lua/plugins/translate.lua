return {
    "niuiic/translate.nvim",
    dependencies = {
        "niuiic/core.nvim"
    },
    -- enabled = false,
    opts = {
        output = {
            float = {
                -- max_width of float window
                max_width = 40,
                -- max_height of float window
                max_height = 5,
                -- whether close float window on cursor move
                close_on_cursor_move = true,
                -- key to enter float window
                enter_key = "T",
            },
        },
        translate = {
            {
                cmd = "TransToEN",
                command = "trans",
                args = function(trans_source)
                    return {
                        "-b",
                        "-e",
                        "google",
                        "-t",
                        "en",
                        trans_source,
                    }
                end,
                input = "selection",
                output = { "notify", "clipboard" },
            },
        },
    },
    keys = {
        { mode = "v", "<leader>tr", "<cmd>TransToEN<CR>", silent = true },
    }
}
