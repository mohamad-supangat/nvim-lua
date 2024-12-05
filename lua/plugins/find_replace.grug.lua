return {
    "MagicDuck/grug-far.nvim",
    config = function()
        require("grug-far").setup({
            -- options, see Configuration section below
            -- there are no required options atm
            -- engine = 'ripgrep' is default, but 'astgrep' can be specified
        })
    end,
    cmd = "GrugFar",
    keys = {
        {
            "<leader>S",
            '<cmd>lua require("grug-far").open()<CR>',
            desc = "Toggle Spectre",
        },
        {
            mode = { "v", "n" },
            "<leader>sw",
            '<cmd>lua require("grug-far").open({ prefills = { search = vim.fn.expand("<cword>") } })<CR>',
            desc = "Search current word",
        },
        {
            "<leader>sp",
            '<cmd>lua  require("grug-far").open({ prefills = { paths = vim.fn.expand("%") } })<CR>',
            desc = "Search on current file",
        },
        {
            "<leader>sf",
            function()
                local currentFilePath = vim.api.nvim_buf_get_name(0)
                local currentFileDirectory, fileName = string.match(currentFilePath, "(.*/)(.*)")
                require("grug-far").open({ prefills = { paths = currentFileDirectory } })
            end,
            desc = "Toggle Spectre Curenf Folder",
        },
    },
}
