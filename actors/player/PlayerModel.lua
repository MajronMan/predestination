local PlayerModel = {}
PlayerModel.__index = PlayerModel

function PlayerModel:new(x, y, width, height, speed)
    return setmetatable(
        {
            x = x,
            y = y,
            width = width,
            height = height,
            speed = speed
        },
        self
    )
end

return PlayerModel
