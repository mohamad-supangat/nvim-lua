--[[

  ██╗███╗   ██╗██╗████████╗██╗     ██╗   ██╗ █████╗
  ██║████╗  ██║██║╚══██╔══╝██║     ██║   ██║██╔══██╗
  ██║██╔██╗ ██║██║   ██║   ██║     ██║   ██║███████║
  ██║██║╚██╗██║██║   ██║   ██║     ██║   ██║██╔══██║
  ██║██║ ╚████║██║   ██║██╗███████╗╚██████╔╝██║  ██║
  ╚═╝╚═╝  ╚═══╝╚═╝   ╚═╝╚═╝╚══════╝ ╚═════╝ ╚═╝  ╚═╝

Neovim init file

Version: -2.3.0 - 2021/10/02

https://hantamkoding.gitlab.io



fork from: https://github.com/brainfucksec/neovim-lua
Tanks to: Brainf+ck for your simple dotfiles and give me idea to use init.lua

--]]

-----------------------------------------------------------
-- Import Lua modules
-----------------------------------------------------------

require('plugins/paq-nvim')         -- plugin manager
require('settings')                 -- settings
require('keymaps')                  -- keymaps
require('plugins/nvim-tree')	      -- file manager
require('plugins/bufferline')       -- beautiful bufferline
require('plugins/feline')           -- statusline
require('plugins/nvim-cmp')         -- autocomplete
require('plugins/nvim-lspconfig')   -- LSP settings
-- require('plugins/vista')            -- tag viewer
require('plugins/nvim-treesitter')  -- tree-sitter interface
require('plugins/nvim-autopairs')   -- autopairs
require('plugins/indentline')       -- indent line
require('plugins/comment')          -- auto comment
require('plugins/floatterm')        -- floating terminal
require('plugins/fzf')
