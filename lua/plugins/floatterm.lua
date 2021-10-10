local fterm = require("FTerm")

local lazygit = fterm:new({
    cmd = "lazygit",
    dimensions = {
        height = 0.9,
        width = 0.9
    }
})

 -- Use this to toggle gitui in a floating terminal
function _G.lazygit()
  lazygit:toggle()
end

local fterm1 = fterm:new({
    cmd = os.getenv('SHELL'),
    border = 'double',
    dimensions = {
        height = 1,
        width = 0.3,
        x = 0,
    }
})

local fterm2 = fterm:new({
    cmd = os.getenv('SHELL'),
    border = 'double',
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

