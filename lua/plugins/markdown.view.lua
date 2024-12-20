return {
    "OXY2DEV/markview.nvim",
    enabled = true,
    lazy = false, -- Recommended
    -- ft = "markdown", -- If you decide to lazy-load anyway

    dependencies = {
        "nvim-treesitter/nvim-treesitter",
    },
    opts = {
        hybrid_modes = { "i" }
    }
}
