return {
  "Mofiqul/vscode.nvim",
  enabled = vim.g.colorschema == "vscode",
  config = function()
    require("vscode").setup({})
    vim.cmd.colorscheme("vscode")
  end,
}
