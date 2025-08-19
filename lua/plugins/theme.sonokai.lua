return {
  "sainnhe/sonokai",
  enabled = vim.g.colorschema == "sonokai",
  config = function()
    -- vim.g.sonokai_style = "atlantis"
    -- vim.g.sonokai_enable_italic = 1
    vim.g.sonokai_better_performance = 1

    vim.cmd("colorscheme sonokai")
  end,
}
