return {
  {
    "milanglacier/minuet-ai.nvim",
    enabled = false,
    config = function()
      require("minuet").setup({
        provider = "gemini",
      })
    end,
  },
}
