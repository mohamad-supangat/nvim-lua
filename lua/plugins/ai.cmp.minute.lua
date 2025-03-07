return {
  {
    "milanglacier/minuet-ai.nvim",
    enabled = true,
    config = function()
      require("minuet").setup({
        provider = "gemini",
      })
    end,
  },
}
