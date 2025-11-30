return {
  "askfiy/nvim-picgo",
  keys = {
    { "<leader>p", ":Obsidian paste_img<CR>", noremap = true, silent = true },
    { "<leader>pi", "<cmd>PicGo<cr>", desc = "PicGo" },
  },
  config = function()
    require("nvim-picgo").setup()
  end,
}
