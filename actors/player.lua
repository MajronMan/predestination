local Player = {}
Player.__index = Player

function Player.new()
    local image = love.graphics.newImage("assets/images/player.png")
    local width = 64
    local height = 64
    local xScale = width / image:getWidth()
    local yScale = height / image:getHeight()
    local x = (love.graphics.getWidth() - width) / 2
    local y = (love.graphics.getHeight() - height) / 2
    local self =
        setmetatable(
        {
            speed = 400,
            width = width,
            height = height,
            x = x,
            y = y,
            image = image,
            xScale = xScale,
            yScale = yScale
        },
        Player
    )
    return self
end

return Player
