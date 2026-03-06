return {
  "nitinbhat972/cwal.nvim",
  enabled = vim.g.colorschema == "cwal",
  priority = 1000,
  config = function()
    vim.cmd.colorscheme("cwal")
  end,
}
