local PlayerView = {}
PlayerView.__index = PlayerView

function PlayerView:new(image, rotation, xScale, yScale, xOffset, yOffset)
    return setmetatable(
        {
            image = image,
            rotation = rotation,
            xScale = xScale,
            yScale = yScale,
            xOffset = xOffset,
            yOffset = yOffset
        },
        self
    )
end

return PlayerView
