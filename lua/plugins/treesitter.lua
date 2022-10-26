local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then return end

configs.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "php", "lua", "vue", "javascript", "json", "html" },
  sync_install = false,
  ignore_install = {},
  highlight = {
    enable = true
    -- additional_vim_regex_highlighting = true
  },
  autopairs = { enable = true },
  autotag = {
    enable = true
    -- filetypes = {"html", "xml"}
  },
  context_commentstring = { enable = true, enable_autocmd = false },
  indent = { enable = true, disable = { "python", "css", "vue", "pug" } },
  rainbow = { enable = true, extended_mode = true }
}

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
