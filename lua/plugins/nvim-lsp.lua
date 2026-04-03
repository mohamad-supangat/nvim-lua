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
      enabled = true,
      config = function()
        vim.keymap.set({ "n", "v" }, "<leader>xe", require("nvim-emmet").wrap_with_abbreviation)
      end,
    },
  },
  keys = {
    { "<leader>li", "<cmd>LspInfo<cr>",        desc = "LSP Info" },
    { "<space>ca",  vim.lsp.buf.code_action,   mode = { "n", "v" },              desc = "LSP Code Action" },
    { "<leader>rn", vim.lsp.buf.rename,        desc = "LSP Rename" },
    { "gd",         vim.lsp.buf.definition,    desc = "LSP Go to Definition" },
    { "gl",         vim.diagnostic.open_float, desc = "Open floating diagnostic" }
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
      update_in_insert = true,
      -- float = {
      --   style = 'minimal',
      --   -- border = 'rounded',
      --   header = '',
      --   prefix = '',
      -- },
      -- virtual_lines = false,
      virtual_lines = {
        current_line = true,
        format = function(diagnostic)
          local message = diagnostic.message
          local win_width = vim.api.nvim_win_get_width(0)
          local max_width = math.floor(win_width * 0.75)
          local max_lines = 5
          local max_length = max_width * max_lines

          if #message > max_length then
            message = message:sub(1, max_length - 3) .. "..."
          end

          if #message <= max_width then
            return message
          end

          local wrapped = {}
          local line = ""

          for word in message:gmatch("%S+") do
            local test_line = line == "" and word or line .. " " .. word

            if #test_line <= max_width then
              line = test_line
            else
              if line ~= "" then
                table.insert(wrapped, line)
                if #wrapped >= max_lines then
                  wrapped[#wrapped] = wrapped[#wrapped] .. "..."
                  break
                end
              end
              line = word
            end
          end

          if line ~= "" and #wrapped < max_lines then
            table.insert(wrapped, line)
          end

          return table.concat(wrapped, "\n")
        end,
      },
      underline = true,
      virtual_text = true,
    })
  end,
  config = function()
    local capabilities = require("config.lsp.capabilities")

    vim.lsp.config("*", {
      capabilities = capabilities,
    })

    -- start config of custom lsp
    vim.lsp.config("unocss", {
      filetypes = {
        "css",
        "vue",
        "pug",
        "html",
        "blade",
      },
    })

    vim.lsp.config("emmet_language_server", {
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
    })

    vim.lsp.config("intelephense", {
      root_markers = { ".rootdir", "composer.json", ".git" },
      filetypes = { "php", "blade" },
    })


    vim.lsp.config['phpantom'] = {
      cmd = { 'phpantom_lsp' },
      filetypes = { 'php', 'blade' },
      root_markers = { '.rootdir', 'composer.json', '.git' },
    }

    -- vue lang server
    local vue_language_server_path = vim.fn.expand("$MASON/packages")
        .. "/vue-language-server"
        .. "/node_modules/@vue/language-server"
    local tsserver_filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" }
    local vue_plugin = {
      name = "@vue/typescript-plugin",
      location = vue_language_server_path,
      languages = { "vue" },
      configNamespace = "typescript",
    }
    local vtsls_config = {
      settings = {
        vtsls = {
          tsserver = {
            globalPlugins = {
              vue_plugin,
            },
          },
        },
      },
      filetypes = tsserver_filetypes,
    }

    local ts_ls_config = {
      init_options = {
        plugins = {
          vue_plugin,
        },
      },
      filetypes = tsserver_filetypes,
    }

    -- If you are on most recent `nvim-lspconfig`
    local vue_ls_config = {
      init_options = {
        plugins = {
          {
            name = "@vue/language-plugin-pug",
            location = vue_language_server_path,
            languages = { "vue" },
          },
        },
      },
    }

    -- nvim 0.11 or above
    vim.lsp.config("vtsls", vtsls_config)
    vim.lsp.config("vue_ls", vue_ls_config)
    vim.lsp.config("ts_ls", ts_ls_config)



    vim.lsp.enable({
      "vtsls",
      "vue_ls",
      'ts_ls',
      'kulala_ls',
      'phpantom'
    })

    require("mason-lspconfig").setup({
      automatic_enable = true,
      automatic_installation = false,
      ensure_installed = {
        "lua_ls",
        -- "vue_ls",
        -- "ts_ls",
        -- "emmet_language_server",
        -- "intelephense",
        -- "tailwindcss",
        -- "jsonls",
        -- "ruff_lsp"
      },
    })



    local group = vim.api.nvim_create_augroup("UserLspConfig", {})
    vim.api.nvim_create_autocmd("LspDetach", {
      group = group,
      callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if not client or not client.attached_buffers then
          return
        end
        for buf_id in pairs(client.attached_buffers) do
          if buf_id ~= ev.buf then
            return
          end
        end
        client:stop()
      end,
      desc = "Auto Detach LSP",
    })


    vim.api.nvim_create_autocmd("LspAttach", {
      group = group,
      desc = "Custom event for LSP Attach",
      callback = function(event)
        local client = vim.lsp.get_client_by_id(event.data.client_id)

        if not client then
          return
        end
        vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = event.buf, desc = "LSP: Hover Documentation" })
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = event.buf, desc = "LSP: Go to Definition" })
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = event.buf, desc = "LSP: Go to Declaration" })
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = event.buf, desc = "LSP: Go to Implementation" })
        vim.keymap.set("n", "go", vim.lsp.buf.type_definition,
          { buffer = event.buf, desc = "LSP: Go to Type Definition" })
        vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = event.buf, desc = "LSP: Find References" })
        vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, { buffer = event.buf, desc = "LSP: Signature Help" })
        vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, { buffer = event.buf, desc = "LSP: Rename Symbol" })
        vim.keymap.set({ "n", "x" }, "<F3>", function() vim.lsp.buf.format({ async = true }) end,
          { buffer = event.buf, desc = "LSP: Format Buffer" })
        vim.keymap.set("n", "<F4>", vim.lsp.buf.code_action, { buffer = event.buf, desc = "LSP: Code Action" })


        vim.api.nvim_buf_create_user_command(event.buf, "LspStop", function()
          if client:is_stopped() then
            vim.notify(client.name:upper() .. " is already stopped", vim.log.levels.WARN)
          else
            client:stop(true)
            vim.notify(client.name:upper() .. " stopped", vim.log.levels.INFO)
          end
        end, { desc = "Stop LSP client for this buffer" })
      end,
    })
  end,
}
