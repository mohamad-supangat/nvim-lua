local status_ok, catppuccin = pcall(require, "catppuccin")
if not status_ok then
    return
end



local transparent_background = true
local clear = {}
-- vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha

catppuccin.setup({
    flavour = "mocha",
    background = { light = "latte", dark = "mocha" },
    show_end_of_buffer = true,
    transparent_background = transparent_background,
    term_colors = true,
    dim_inactive = { enabled = false, shade = "dark", percentage = 0.15 },
    styles = {
        -- comments = { "italic" },
        -- conditionals = { "italic" },
        -- loops = {},
        -- functions = { "italic" },
        -- keywords = {},
        -- strings = {},
        -- variables = { "italic" },
        -- numbers = { "bold" },
        -- booleans = {},
        -- properties = {},
        -- types = { "bold" },
        -- operators = {},
        comments = { "italic" },
        properties = { "italic" },
        functions = { "bold" },
        keywords = { "italic" },
        operators = { "bold" },
        conditionals = { "bold" },
        loops = { "bold" },
        booleans = { "bold", "italic" },
        numbers = {},
        types = {},
        strings = {},
        variables = {},
    },
    integrations = {
        telescope = {
            enabled = false,
            style = "nvchad",
        },
        treesitter = true,
        cmp = true,
        gitsigns = true,
        nvimtree = false,
        window_picker = true,
        mini = true,
        lsp_trouble = true,
        symbols_outline = true,
        notify = true,
        neotree = true,
        indent_blankline = { enabled = true, colored_indent_levels = true },
        native_lsp = {
            enabled = true,
            virtual_text = {
                errors = { "italic" },
                hints = { "italic" },
                warnings = { "italic" },
                information = { "italic" },
            },
            underlines = {
                errors = { "underline" },
                hints = { "underline" },
                warnings = { "underline" },
                information = { "underline" },
            },
        },
        -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
    },
    color_overrides = {
        -- mocha = {
        --     base = "#000000",
        --     mantle = "#000000",
        --     crust = "#000000",
        -- },
    },
    highlight_overrides = {
        ---@param cp palette
        all = function(cp)
            return {
                -- For base configs
                NormalFloat = { fg = cp.text, bg = transparent_background and cp.none or cp.mantle },
                FloatBorder = {
                    fg = transparent_background and cp.blue or cp.mantle,
                    bg = transparent_background and cp.none or cp.mantle,
                },
                CursorLineNr = { fg = cp.green },

                -- For native lsp configs
                DiagnosticVirtualTextError = { bg = cp.none },
                DiagnosticVirtualTextWarn = { bg = cp.none },
                DiagnosticVirtualTextInfo = { bg = cp.none },
                DiagnosticVirtualTextHint = { bg = cp.none },
                LspInfoBorder = { link = "FloatBorder" },

                -- For mason.nvim
                MasonNormal = { link = "NormalFloat" },

                -- For indent-blankline
                IndentBlanklineChar = { fg = cp.surface0 },
                IndentBlanklineContextChar = { fg = cp.surface2, style = { "bold" } },

                -- For nvim-cmp and wilder.nvim
                Pmenu = { fg = cp.overlay2, bg = transparent_background and cp.none or cp.base },
                PmenuBorder = { fg = cp.surface1, bg = transparent_background and cp.none or cp.base },
                PmenuSel = { bg = cp.green, fg = cp.base },
                CmpItemAbbr = { fg = cp.overlay2 },
                CmpItemAbbrMatch = { fg = cp.blue, style = { "bold" } },
                CmpDoc = { link = "NormalFloat" },
                CmpDocBorder = {
                    fg = transparent_background and cp.surface1 or cp.mantle,
                    bg = transparent_background and cp.none or cp.mantle,
                },

                -- For fidget
                FidgetTask = { bg = cp.none, fg = cp.surface2 },
                FidgetTitle = { fg = cp.blue, style = { "bold" } },

                -- For nvim-tree
                NvimTreeRootFolder = { fg = cp.pink },
                NvimTreeIndentMarker = { fg = cp.surface2 },

                -- For trouble.nvim
                TroubleNormal = { bg = transparent_background and cp.none or cp.base },

                -- For telescope.nvim
                TelescopeMatching = { fg = cp.lavender },
                TelescopeResultsDiffAdd = { fg = cp.green },
                TelescopeResultsDiffChange = { fg = cp.yellow },
                TelescopeResultsDiffDelete = { fg = cp.red },

                -- For glance.nvim
                GlanceWinBarFilename = { fg = cp.subtext1, style = { "bold" } },
                GlanceWinBarFilepath = { fg = cp.subtext0, style = { "italic" } },
                GlanceWinBarTitle = { fg = cp.teal, style = { "bold" } },
                GlanceListCount = { fg = cp.lavender },
                GlanceListFilepath = { link = "Comment" },
                GlanceListFilename = { fg = cp.blue },
                GlanceListMatch = { fg = cp.lavender, style = { "bold" } },
                GlanceFoldIcon = { fg = cp.green },

                -- For nvim-treehopper
                TSNodeKey = {
                    fg = cp.peach,
                    bg = transparent_background and cp.none or cp.base,
                    style = { "bold", "underline" },
                },

                -- For treesitter
                ["@keyword.return"] = { fg = cp.pink, style = clear },
                ["@error.c"] = { fg = cp.none, style = clear },
                ["@error.cpp"] = { fg = cp.none, style = clear },
            }
        end,
    },
})

vim.cmd([[colorscheme catppuccin]])

-- settting notfiy background color to black
require("notify").setup({
    background_colour = "#000000",
})
