return {
  "HakonHarnes/img-clip.nvim",
  enabled = false,
  event = "VeryLazy",
  opts = {
    default = {
      url = {
        enable = false,
      },
      use_cursor_in_template = false,
      embed_image_as_base64 = false,
      prompt_for_file_name = false,
      insert_mode_after_paste = false,
      process_cmd = "convert - -resize 50% -quality 85 -",
      drag_and_drop = {
        insert_mode = true,
      },
      -- required for Windows users
      -- use_absolute_path = true,
    },
  },
  keys = {
    -- suggested keymap
    { "<leader>p", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
  },
}
