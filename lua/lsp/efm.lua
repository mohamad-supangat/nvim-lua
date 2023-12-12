-- Register linters and formatters per language
-- local eslint = require('efmls-configs.linters.eslint')
local prettier = require("efmls-configs.formatters.prettier")
local stylua = require("efmls-configs.formatters.stylua")
local languages = require("efmls-configs.defaults").languages()
languages = vim.tbl_extend("force", languages, {
    -- Custom languages, or override existing ones
    --
    php = {
        require('efmls-configs.formatters.php_cs_fixer'),
        -- require('efmls-configs.formatters.pint')
    },
    html = { prettier },
    typescript = { prettier },
    javascript = { prettier },
    vue = { prettier },
    json = { prettier, require("efmls-configs.formatters.fixjson") },
    jsonc = { prettier },
    lua = {},
})

local efmls_config = {
    filetypes = vim.tbl_keys(languages),
    settings = {
        rootMarkers = { ".git/" },
        languages = languages,
    },
    init_options = {
        documentFormatting = true,
        documentRangeFormatting = true,
    },
}

require("lspconfig").efm.setup(vim.tbl_extend("force", efmls_config, {
    -- Pass your custom lsp config below like on_attach and capabilities
    --
    on_attach = require("lsp.handlers").on_attach,
    capabilities = require("lsp.handlers").capabilities,
}))
