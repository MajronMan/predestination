local Gui = {}
Gui.__index = Gui

function Gui:new(font)
    return setmetatable({font = font}, self)
end

function Gui:draw(playerModel)
    local p = playerModel
    love.graphics.printf(
        {
            {1, 0, 0},
            string.format("HP: %d / %d\n", p.hp, p.maxHp),
            {0, 0, 1},
            string.format("MP: %d / %d\n", p.mp, p.maxMp),
            {1, 0, 1},
            string.format("IP: %d / %d\n", p.ip, p.maxIp)
        },
        0,
        0,
        love.graphics.getWidth()
    )
end

return Gui
