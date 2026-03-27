return {
  "brianhuster/live-preview.nvim",
  enabled = vim.g.markdown_render == 'live',
  ft = { "markdown", "html" },
  cmd = "LivePreview",
}
