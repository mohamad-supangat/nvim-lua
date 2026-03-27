return {
  "OXY2DEV/markview.nvim",
  enabled = vim.g.markdown_render == "markview",
  lazy = false,
  priority = 49,
  opts = {
    preview = {
      filetypes = {
        "md",
        "rmd",
        "quarto",
        "codecompanion",
        "Avante",
        "markdown",
        "html",
        "yaml"
      },
    },
  },
}
