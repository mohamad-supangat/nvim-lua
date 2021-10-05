local fterm = require("FTerm")

fterm.setup({
    border = 'double',
    dimensions  = {
        height = 0.9,
        width = 0.9,
    },
})

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


