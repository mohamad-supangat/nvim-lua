return {
    'stevearc/aerial.nvim',
    enabled = false,
    opts = {},
    cmd = { 'AerialToggle' },
    keys = { -- Example mapping to toggle outline
        { "<f7>", "<cmd>AerialToggle<CR>", desc = "Toggle outline" },
    },
    -- Optional dependencies
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons"
    },
}
