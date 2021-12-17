local fterm = require("FTerm")

local lazygit = fterm:new({
    cmd = "lazygit",
    blend = 20,
    dimensions = {
        height = 0.9,
        width = 0.9
    }
})

 -- Use this to toggle gitui in a floating terminal
function _G.lazygit()
  -- lazygit:toggle()
  os.execute('/opt/sublime_merge/sublime_merge ' .. vim.fn.getcwd())
end

local fterm1 = fterm:new({
    cmd = os.getenv('SHELL'),
    border = 'double',
    blend = 20,
    dimensions = {
        height = 1,
        width = 0.3,
        x = 0,
    }
})

local fterm2 = fterm:new({
    cmd = os.getenv('SHELL'),
    border = 'double',
    blend = 20,
    dimensions = {
        height = 1,
        width = 0.3,
        x = 1,
    }
})

function _G.fterm1()
  fterm1:toggle()
end

function _G.fterm2()
  fterm2:toggle()
end

