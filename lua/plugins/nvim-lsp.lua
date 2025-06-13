return {
  "neovim/nvim-lspconfig",
  cmd = { "LspInfo", "LspInstall", "LspStart" },
  enabled = true,
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    {
      "mason-org/mason-lspconfig.nvim",
      dependencies = {
        {
          "mason-org/mason.nvim",
          config = true,
        },
      },
    },
    {
      "olrtg/nvim-emmet",
      enabled = false,
      config = function()
        vim.keymap.set({ "n", "v" }, "<leader>xe", require("nvim-emmet").wrap_with_abbreviation)
      end,
    },
  },
  keys = {
    { "<leader>li", "<cmd>LspInfo<cr>" },
    { "<space>ca", vim.lsp.buf.code_action, mode = { "n", "v" } },
    { "<leader>rn", vim.lsp.buf.rename },
    { "gd", vim.lsp.buf.definition },
    { "gl", vim.diagnostic.open_float },
  },

  init = function()
    vim.diagnostic.config({
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = "✘",
          [vim.diagnostic.severity.WARN] = "▲",
          [vim.diagnostic.severity.HINT] = "⚑",
          [vim.diagnostic.severity.INFO] = "»",
        },
      },
      severity_sort = true,
      -- float = {
      --   style = 'minimal',
      --   -- border = 'rounded',
      --   header = '',
      --   prefix = '',
      -- },
      virtual_lines = false,
      underline = true,
      virtual_text = true,
    })
  end,
  config = function()
    local lspconfig = require("lspconfig")

    vim.api.nvim_create_autocmd("LspAttach", {
      desc = "LSP actions",
      callback = function(event)
        local opts = { buffer = event.buf }

        vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
        vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
        vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
        vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
        vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
        vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
        vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
        vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
        vim.keymap.set({ "n", "x" }, "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
        vim.keymap.set("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
      end,
    })

    vim.lsp.config.unocss = {
      filetypes = {
        "css",
        "vue",
        "pug",
        "html",
        "blade",
      },
    }

    vim.lsp.config.emmet_language_server = {
      filetypes = {
        "css",
        "eruby",
        "html",
        "javascript",
        "javascriptreact",
        "less",
        "sass",
        "scss",
        "pug",
        "typescriptreact",
        "blade",
        "vue",
        "php",
        "html.handlebars",
      },
    }

    vim.lsp.config.ts_ls = {
      filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
      init_options = {
        plugins = {
          {
            name = "@vue/typescript-plugin",
            location = vim.fn.stdpath("data")
              .. "/mason/packages/vue-language-server/node_modules/@vue/language-server",
            languages = { "vue" },
          },
        },
      },
    }

    vim.lsp.enable("kulala_ls")

    require("mason-lspconfig").setup({
      automatic_enable = true,
      automatic_installation = false,
      ensure_installed = {
        "lua_ls",
        "vue_ls",
        "ts_ls",
        "emmet_language_server",
        "intelephense",
        -- "tailwindcss",
        -- "jsonls",
        -- "ruff_lsp"
      },
    })
  end,
}
