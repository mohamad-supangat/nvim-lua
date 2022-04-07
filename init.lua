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
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/paqs/start/paq-nvim"

if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({"git", "clone", "--depth=1", "https://github.com/savq/paq-nvim.git", install_path})
end
-----------------------------------------------------------
-- Import Lua modules
-----------------------------------------------------------

require("plugins/paq-nvim") -- plugin manager
require("settings") -- settings
require("keymaps") -- keymaps

-- require('plugins.circle-nvim')
require("plugins/bufferline") -- beautiful bufferline

require('plugins/vista')            -- tag viewer

require("plugins/alpha-nvim") -- dashboard
require("plugins/indentline") -- indent line
require("plugins/comment") -- auto comment
require("plugins/floatterm") -- floating terminal
require("plugins/fzf") -- file search

require("plugins/accelerated-jk") -- accelerated-jk
-- require('plugins/colorizer')        -- show color in editor

-- require("plugins/nvim-gps")
require("plugins/feline") -- statusline
-- require("plugins/session-manager")
require("plugins/coc")
