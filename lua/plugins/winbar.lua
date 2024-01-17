return {
    "ColinKennedy/winbar.nvim",
    enabled = false,
    dependencies = {
        {
            "ColinKennedy/nvim-gps",
            opts = {
                -- separator = ' / ',
                icons = {
                    ["class-name"] = ' ', -- Classes and class-like objects
                    ["function-name"] = ' ', -- Functions
                    ["method-name"] = ' ', -- Methods (functions inside class-like objects)
                    ["container-name"] = " ", -- Containers (example: lua tables)
                    ["tag-name"] = '炙' -- Tags (example: html tags)
                },
            }
        }
    },
    opts = {
        enabled = true,
        show_file_path = true,
        show_symbols = true,
        exclude_filetype = {
            'help',
            'startify',
            'dashboard',
            'packer',
            'neogitstatus',
            'NvimTree',
            'Trouble',
            'alpha',
            'lir',
            'Outline',
            'spectre_panel',
            'toggleterm',
            'qf',
            "fzf",
            "term",
            "term:",
            "NvimTree",
            "terminal",
            "startify",
            "nvim-tree",
            "CHADTree",
            "chad-tree",
            "no-profile",
            "alpha",
            "coc-explorer",
            "Starter",
            "starter",
            "FTerm",
            "lazygit",
        }
    },
}
