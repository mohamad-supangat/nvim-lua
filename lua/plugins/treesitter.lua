local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then return end

configs.setup({
  -- A list of parser names, or "all"
  ensure_installed = { "php", "lua", "vue", "javascript", "json", "html" },
  sync_install = false,
  ignore_install = {},
  highlight = {
    enable = true,
    disable = function(lang, buf)
      local max_filesize = 100 * 1024 -- 100 KB
      local ok, stats = pcall(vim.loop.fs_stat,
        vim.api.nvim_buf_get_name(buf))
      if ok and stats and stats.size > max_filesize then
        return true
      end
    end
    -- additional_vim_regex_highlighting = true
  },
  autopairs = { enable = true },
  autotag = {
    enable = true
    -- filetypes = {"html", "xml"}
  },
  context_commentstring = { enable = true, enable_autocmd = false },
  indent = { enable = true, disable = { "python", "pug", "vue" } },
  rainbow = { enable = true, extended_mode = true }
})

-- require("nvim-biscuits").setup(
--     {
--         default_config = {
--             max_length = 12,
--             min_distance = 5,
--             prefix_string = " 📎 "
--         },
--         language_config = {
--             html = {
--                 prefix_string = " 🌐 "
--             },
--             javascript = {
--                 prefix_string = " ✨ ",
--                 max_length = 80
--             },
--             -- python = {
--             --     disabled = true
--             -- }
--         }
--     }
-- )

require("treesitter-context").setup({
  enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
  max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
  trim_scope = "outer", -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
  min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
  patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
    -- For all filetypes
    -- Note that setting an entry here replaces all other patterns for this entry.
    -- By setting the 'default' entry below, you can control which nodes you want to
    -- appear in the context window.
    default = {
      "class", "function", "method", "for", "while", "if", "switch",
      "case", "interface", "struct", "enum"
    },
    -- Patterns for specific filetypes
    -- If a pattern is missing, *open a PR* so everyone can benefit.
    tex = { "chapter", "section", "subsection", "subsubsection" },
    haskell = { "adt" },
    rust = { "impl_item" },
    terraform = { "block", "object_elem", "attribute" },
    scala = { "object_definition" },
    vhdl = { "process_statement", "architecture_body", "entity_declaration" },
    markdown = { "section" },
    elixir = {
      "anonymous_function", "arguments", "block", "do_block", "list",
      "map", "tuple", "quoted_content"
    },
    json = { "pair" },
    typescript = { "export_statement" },
    yaml = { "block_mapping_pair" }
  },
  exact_patterns = {
    -- Example for a specific filetype with Lua patterns
    -- Treat patterns.rust as a Lua pattern (i.e "^impl_item$" will
    -- exactly match "impl_item" only)
    -- rust = true,
  },
  -- [!] The options below are exposed but shouldn't require your attention,
  --     you can safely ignore them.

  zindex = 20, -- The Z-index of the context window
  mode = "cursor", -- Line used to calculate context. Choices: 'cursor', 'topline'
  -- Separator between context and content. Should be a single character string, like '-'.
  -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
  separator = "-"
})
-- require("nvim_context_vt").setup({
-- 	-- Enable by default. You can disable and use :NvimContextVtToggle to maually enable.
-- 	-- Default: true
-- 	enabled = true,
-- 	-- Override default virtual text prefix
-- 	-- Default: '-->'
-- 	-- prefix = '',
--
-- 	-- Override the internal highlight group name
-- 	-- Default: 'ContextVt'
-- 	-- highlight = 'CustomContextVt',
--
-- 	-- Disable virtual text for given filetypes
-- 	-- Default: { 'markdown' }
-- 	disable_ft = { "markdown" },
-- 	-- Disable display of virtual text below blocks for indentation based languages like Python
-- 	-- Default: false
-- 	disable_virtual_lines = false,
-- 	-- Same as above but only for spesific filetypes
-- 	-- Default: {}
-- 	disable_virtual_lines_ft = { "yaml" },
-- 	-- How many lines required after starting position to show virtual text
-- 	-- Default: 1 (equals two lines total)
-- 	min_rows = 1,
-- })
