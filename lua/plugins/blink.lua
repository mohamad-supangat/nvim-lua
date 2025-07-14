return {

  {
    "saghen/blink.cmp",
    enabled = false,
    -- version = "1.*",
    version = false,
    event = { "LspAttach", "InsertCharPre" },
    dependencies = {
      {
        "saghen/blink.compat",
        opts = {
          impersonate_nvim_cmp = true,
          enable_events = true,
        },
      },
      {
        "supermaven-inc/supermaven-nvim",
        opts = {
          disable_inline_completion = true,
        },
      },
    },
    opts = {
      enabled = function()
        -- return vim.b.completion ~= false
        return not vim.tbl_contains(require("variables").exclude, vim.bo.filetype)
        --     and vim.bo.buftype ~= "prompt"
        --     and vim.b.completion ~= false
      end,
      -- signature = { enabled = true },
      fuzzy = {
        sorts = {
          "score",
        },
        implementation = "lua",
        -- implementation = "rust",

        -- prebuilt_binaries = {
        --     force_version = "v0.7.3",
        -- },
      },
      snippets = { preset = "luasnip" },
      sources = {
        default = {
          "supermaven",
          -- "codeium",
          "lazydev",
          -- "avante",
          "snippets",
          "lsp",
          "path",
          "buffer",
          -- "minuet",
        },
        providers = {
          copilot = {
            name = "copilot",
            module = "blink-copilot",
            score_offset = 100,
            async = true,
          },
          avante = {
            module = "blink-cmp-avante",
            name = "Avante",
            opts = {
              -- options for blink-cmp-avante
            },
          },
          supermaven = {
            name = "supermaven",
            module = "blink.compat.source",
            score_offset = 1000,
            transform_items = function(_, items)
              local CompletionItemKind = require("blink.cmp.types").CompletionItemKind
              local kind_idx = #CompletionItemKind + 1
              CompletionItemKind[kind_idx] = "Supermaven"
              for _, item in ipairs(items) do
                item.kind = kind_idx
              end
              return items
            end,
          },
          minuet = {
            name = "minuet",
            module = "minuet.blink",
            async = true,
            score_offset = 10000,
          },
          -- codeium = { name = "Codeium", module = "codeium.blink", async = true, score_offset = 10000 },
          -- codeium = {
          --   name = "codeium",
          --   module = "blink.compat.source",
          --   score_offset = 10000,
          -- },
          lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            -- make lazydev completions top priority (see `:h blink.cmp`)
            score_offset = 100,
          },
        },
      },

      keymap = {
        preset = "none",
        ["<A-y>"] = {
          function(cmp)
            cmp.show({ providers = { "minuet" } })
          end,
        },
        ["<CR>"] = { "accept", "fallback" },
        ["<C-space>"] = { "show", "hide" },
        ["<C-S-k>"] = { "show_documentation", "hide_documentation", "fallback" },
        ["<C-e>"] = { "hide", "fallback" },

        ["<Up>"] = { "select_prev", "fallback" },
        ["<Down>"] = { "select_next", "fallback" },
        ["<S-Tab>"] = { "select_prev", "fallback" },
        ["<Tab>"] = { "select_next", "fallback" },
        ["<C-k>"] = { "select_prev", "fallback" },
        ["<C-j>"] = { "select_next", "fallback" },

        -- ["<C-l>"] = { "accept", "fallback" },
        ["<C-b>"] = { "scroll_documentation_up", "fallback" },
        ["<C-f>"] = { "scroll_documentation_down", "fallback" },
      },
      completion = {
        keyword = { range = "full" },
        accept = { auto_brackets = { enabled = false } },
        list = { selection = { preselect = true, auto_insert = false } },
        menu = {
          -- auto_show = true,
          auto_show = function(ctx)
            -- return ctx.mode ~= 'cmdline' and
            -- not vim.tbl_contains({ '/', '?' }, vim.fn.getcmdtype()) and
            return not vim.tbl_contains(require("variables").exclude, vim.bo.filetype)
          end,
          draw = {
            gap = 2,
            padding = { 1, 1 }, -- padding only on right side
            components = {},
            -- kind_icon = {
            --   text = function(ctx)
            --     return " " .. ctx.kind_icon .. ctx.icon_gap .. " "
            --   end,
            -- },
            columns = { { "label", "label_description", gap = 1 }, { "kind", gap = 1 } },
            -- treesitter = { 'lsp' }
          },
        },
        documentation = {
          auto_show = true,
          -- auto_show_delay_ms = 200,
          window = {},
        },
        trigger = {
          prefetch_on_insert = false,
          show_on_trigger_character = false,
          show_on_insert_on_trigger_character = false,
          show_on_accept_on_trigger_character = false,
        },
        ghost_text = { enabled = false },
      },
      -- signature = { window = { border = 'single' } },
      appearance = {
        use_nvim_cmp_as_default = true,
        -- nerd_font_variant = 'mono'
      },
    },
    opts_extend = {
      "sources.default",
      "sources.completion.enabled_providers",
    },
  },
}
