return {
  "nvimtools/none-ls.nvim",
  enabled = true,
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    -- {
    --     "garymjr/nvim-snippets",
    -- },
  },

  keys = {
    {
      "<leader>fm",
      "<cmd>lua vim.lsp.buf.format({async = true})<cr>",
      noremap = true,
      silent = true,
      desc = "Format Buffer",
    },
  },

  config = function()
    local null_ls = require("null-ls")
    local formatting = null_ls.builtins.formatting
    local diagnostics = null_ls.builtins.diagnostics
    local completion = null_ls.builtins.completion
    local hover = null_ls.builtins.hover

    -- require("snippets").setup({
    --     create_autocmd = true,
    --     create_cmp_source = false,
    --     friendly_snippets = true,
    -- })

    null_ls.setup({
      cache = false,
      debug = false,
      temp_dir = "/tmp",
      -- on_attach = require("lsp.handlers").on_attach,
      sources = {
        completion.tags,
        formatting.blade_formatter,
        -- completion.spell,
        -- completion.nvim_snippets,
        formatting.phpcsfixer,
        formatting.prettier.with({
          extra_filetypes = { "toml" },
          condition = function(utils)
            return utils.root_has_file({ ".prettierrc" })
          end,
        }),
        diagnostics.fish,
        -- diagnostics.editorconfig_checker,
        hover.dictionary,
      },

      -- on_attach = function(client, bufnr)
      -- Auto Format On Save
      -- if client.supports_method("textDocument/formatting") then
      --     vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      --     vim.api.nvim_create_autocmd("BufWritePre", {
      --         group = augroup,
      --         buffer = bufnr,
      --         callback = function()
      --             vim.lsp.buf.format({ bufnr = bufnr, async = true })
      --         end,
      --     })
      -- end
      -- end,
    })
  end,
}
