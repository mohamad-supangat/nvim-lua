local status_ok, configs = pcall(require, "nvim-treesitter.configs")
local variables = require("variables")
if not status_ok then
    return
end

configs.setup({
    -- A list of parser names, or "all"
    ensure_installed = variables.filetypes,
    sync_install = false,
    ignore_install = {},
    highlight = {
        enable = true,
        -- disable = function(lang, buf)
        -- 	local max_filesize = 100 * 1024 -- 100 KB
        -- 	local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        -- 	if ok and stats and stats.size > max_filesize then
        -- 		return true
        -- 	end
        -- end,
        additional_vim_regex_highlighting = true,
    },
    -- autopairs = { enable = true },
    autotag = {
        enable = true,
        filetypes = {
            "html",
            "javascript",
            "typescript",
            "javascriptreact",
            "typescriptreact",
            "svelte",
            "vue",
            "tsx",
            "jsx",
            "rescript",
            "xml",
            "php",
            "markdown",
            "glimmer",
            "handlebars",
            "hbs",
            "blade",
        },
    },
    indent = { enable = true, disable = { 'pug', 'vue', 'blade' } },
})

-- require("treesitter-context").setup({
-- 	enable = true,
-- })


local rainbow_delimiters = require 'rainbow-delimiters'

vim.g.rainbow_delimiters = {
    strategy = {
        [''] = rainbow_delimiters.strategy['global'],
        commonlisp = rainbow_delimiters.strategy['local'],
    },
    query = {
        [''] = 'rainbow-delimiters',
        lua = 'rainbow-blocks',
    },
    highlight = {
        'RainbowDelimiterRed',
        'RainbowDelimiterYellow',
        'RainbowDelimiterBlue',
        'RainbowDelimiterOrange',
        'RainbowDelimiterGreen',
        'RainbowDelimiterViolet',
        'RainbowDelimiterCyan',
    },
    blacklist = { 'c', 'cpp' },
}
