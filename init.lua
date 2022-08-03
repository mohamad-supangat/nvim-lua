--  ╭──────────────────────────────────────────────────────────╮
--  │ init lua                                                 │
--  │ powered by hantamkoding 2022                             │
--  │                                                          │
--  ╰──────────────────────────────────────────────────────────╯
local fn = vim.fn

-- bootstarping packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap =
        fn.system(
        {
            "git",
            "clone",
            "--depth",
            "1",
            "https://github.com/wbthomason/packer.nvim",
            install_path
        }
    )
end

require("settings") -- settings
require("keymaps") -- keymaps

require("packer").startup(
    function(use)
        use "wbthomason/packer.nvim"

        use "kyazdani42/nvim-web-devicons"
        use "nvim-lua/plenary.nvim"

        -- more hgithlight
        use "sheerun/vim-polyglot"
        use "tpope/vim-sleuth"

        -- lsp and syntax helper
        use {
            "neoclide/coc.nvim",
            branch = "release",
            config = function()
                require("plugins/coc")
            end
        }

        use {
            "nvim-treesitter/nvim-treesitter",
            run = ":TSUpdate",
            config = function()
                require("plugins/treesitter")
            end
        }

        use {
            "code-biscuits/nvim-biscuits",
            requires = {"nvim-treesitter/nvim-treesitter"},
            config = function()
                require("plugins/treesitter")
            end
        }

        use {
            "p00f/nvim-ts-rainbow",
            requires = {"nvim-treesitter/nvim-treesitter"},
            config = function()
                require("plugins/treesitter")
            end
        }

        -- auto generate commentstring base on treesitter
        use {
            "JoosepAlviste/nvim-ts-context-commentstring",
            requires = {"nvim-treesitter/nvim-treesitter"},
            config = function()
                require("plugins/treesitter")
            end
        }

        use "honza/vim-snippets"
        use {
            "alvan/vim-closetag",
            config = function()
                require("plugins/auto-closetag")
            end
        }

        -- utils
        use "gpanders/editorconfig.nvim"
        use {
            "lukas-reineke/indent-blankline.nvim",
            config = function()
                require("plugins/indentline")
            end
        }
        use {
            "echasnovski/mini.nvim",
            branch = "stable",
            config = function()
                require("plugins/mini")
            end
        }
        use "sbdchd/neoformat"
        use {
            "danymat/neogen",
            requires = "nvim-treesitter/nvim-treesitter",
            config = function()
                require("plugins.comment")
            end
            -- Uncomment next line if you want to follow only stable versions
            -- tag = "*"
        }

        use {
            "LudoPinelli/comment-box.nvim",
            config = function()
                require("plugins.comment")
            end
        }
        -- use "christoomey/vim-tmux-navigator"
        use {
            "alexghergh/nvim-tmux-navigation",
            config = function()
                require "nvim-tmux-navigation".setup {
                    disable_when_zoomed = true, -- defaults to false
                    keybindings = {
                        left = "<C-h>",
                        down = "<C-j>",
                        up = "<C-k>",
                        right = "<C-l>",
                        last_active = "<C-\\>",
                        next = "<C-Space>"
                    }
                }
            end
        }
        use {
            "numtostr/FTerm.nvim",
            config = function()
                require("plugins/floatterm")
            end
        }

        use {
            "xiyaowong/accelerated-jk.nvim",
            config = function()
                require("plugins/accelerated-jk")
            end
        }

        use {
            "ibhagwan/fzf-lua",
            config = function()
                require("plugins/fzf")
            end
        }
        use {"antoinemadec/coc-fzf", requires = {"ibhagwan/fzf-lua"}}

        use(
            {
                "catppuccin/nvim",
                config = function()
                    vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
                    require("catppuccin").setup(
                        {
                            dim_inactive = {
                                enabled = true,
                                shade = "dark",
                                percentage = 0.15
                            },
                            transparent_background = true,
                            term_colors = false,
                            compile = {
                                enabled = false,
                                path = vim.fn.stdpath "cache" .. "/catppuccin"
                            },
                            styles = {
                                comments = {"italic"},
                                conditionals = {"italic"},
                                loops = {"bold"},
                                functions = {"italic"},
                                keywords = {},
                                strings = {},
                                variables = {"italic"},
                                numbers = {},
                                booleans = {"bold"},
                                properties = {},
                                types = {"italic", "bold"},
                                operators = {}
                            },
                            integrations = {
                                treesitter = true,
                                native_lsp = {
                                    enabled = false,
                                    virtual_text = {
                                        errors = {"italic"},
                                        hints = {"italic"},
                                        warnings = {"italic"},
                                        information = {"italic"}
                                    },
                                    underlines = {
                                        errors = {"underline"},
                                        hints = {"underline"},
                                        warnings = {"underline"},
                                        information = {"underline"}
                                    }
                                },
                                coc_nvim = true,
                                lsp_trouble = false,
                                cmp = false,
                                lsp_saga = false,
                                gitgutter = false,
                                gitsigns = false,
                                leap = false,
                                telescope = false,
                                nvimtree = {
                                    enabled = false,
                                    show_root = true,
                                    transparent_panel = false
                                },
                                neotree = {
                                    enabled = false,
                                    show_root = true,
                                    transparent_panel = false
                                },
                                dap = {
                                    enabled = false,
                                    enable_ui = false
                                },
                                which_key = false,
                                indent_blankline = {
                                    enabled = true,
                                    colored_indent_levels = false
                                },
                                dashboard = false,
                                neogit = false,
                                vim_sneak = false,
                                fern = false,
                                barbar = false,
                                bufferline = false,
                                markdown = false,
                                lightspeed = false,
                                ts_rainbow = true,
                                hop = false,
                                notify = true,
                                telekasten = false,
                                symbols_outline = false,
                                mini = true,
                                aerial = false,
                                vimwiki = false,
                                beacon = false
                            },
                            color_overrides = {},
                            highlight_overrides = {}
                        }
                    )

                    vim.cmd [[colorscheme catppuccin]]
                end
            }
        )

        if packer_bootstrap then
            require("packer").sync()
        end
    end
)
