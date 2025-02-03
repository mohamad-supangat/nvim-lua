return {
    {
        'milanglacier/minuet-ai.nvim',
        enabled = false,
        config = function()
            require('minuet').setup {
                provider = 'gemini',
                -- Your configuration options here
            }
        end,
    },
}
