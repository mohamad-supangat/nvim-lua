return {
  "mfussenegger/nvim-lint",
  enabled = vim.g.null_ls ~= 1,
  dependencies = {
    "mason-org/mason.nvim",
  },
  config = function()
    require("lint").linters_by_ft = {
      php = { "phpcs" },
    }

    vim.api.nvim_create_autocmd({ "BufWritePost" }, {
      callback = function()
        require("lint").try_lint()
      end,
    })
  end,
}
