return {
  "MeanderingProgrammer/render-markdown.nvim",
  enabled = vim.g.markdown_render == "render-markdown",
  ft = { "markdown", "Avante", "codecompanion" },
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  config = function()
    require("render-markdown").setup({
      completions = {
        lsp = { enabled = true },
        blink = { enabled = true },
      },
      file_types = { "markdown", "Avante", "codecompanion", "html", "yaml" },
      anti_conceal = { enabled = false },
    })

    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "markdown" },
      callback = function()
        vim.opt_local.wrap = false
        vim.opt_local.textwidth = 0
      end,
    })
  end,
}
