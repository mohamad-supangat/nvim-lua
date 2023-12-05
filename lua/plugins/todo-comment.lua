return {
    "folke/todo-comments.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    event = "VeryLazy",
    opts = {
        keywords = {
            WIP = { icon = " ", color = "hint", alt = { "WIP" } },
        }
    }
}
