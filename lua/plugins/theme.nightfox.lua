return {
  "EdenEast/nightfox.nvim",
  enabled = vim.g.colorschema == "nightfox",
  config = function()
    vim.cmd("colorscheme nightfox")
  end,
}
