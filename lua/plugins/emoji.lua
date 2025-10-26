return {
  "allaman/emoji.nvim",
  enabled = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    enable_cmp_integration = false,
  },
  config = function(_, opts)
    require("emoji").setup(opts)
    vim.keymap.set("n", "<leader>se", "<cmd>Emoji<cr>", { desc = "[S]earch [E]moji" })
  end,
}
