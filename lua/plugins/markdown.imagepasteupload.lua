return {
  "mohamad-supangat/nvim-picgo",
  branch = "fix/error",
  -- dev = true,
  keys = {
    -- { "<leader>p",  ":Obsidian paste_img<CR>", noremap = true, silent = true },
    { "<leader>pi", "<cmd>lua require'nvim-picgo'.upload_clipboard()<cr>", desc = "PicGo upload_clipboard" },
  },
  config = function()
    require("nvim-picgo").setup({
      debug = true,
      auto_insert = true,
      need_jsdeliver = false,
    })
  end,
}
