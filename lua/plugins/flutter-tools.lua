return {
    "akinsho/flutter-tools.nvim",
    lazy = false,
    enabled = true,
    dependencies = {
        "nvim-lua/plenary.nvim",
        -- "stevearc/dressing.nvim", -- optional for vim.ui.select
    },
    config = true,
    opts = {
        dev_log = {
            enabled = true,
            notify_errors = false,
            open_cmd = "30vnew",
        },
    },
}
