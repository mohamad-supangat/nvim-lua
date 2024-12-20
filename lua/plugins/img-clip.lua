return {
    "HakonHarnes/img-clip.nvim",
    event = "VeryLazy",
    opts = {
        default = {
            use_cursor_in_template = false,
            prompt_for_file_name = false,
            insert_mode_after_paste = false,
            process_cmd = "convert - -resize 50% -quality 85 -",
        },
    },
    keys = {
        -- suggested keymap
        { "<leader>p", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
    },
}
