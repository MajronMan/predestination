local ImageRenderer = {}

ImageRenderer.__index = ImageRenderer

function ImageRenderer.new(image, x, y, rotation, xScale, yScale, xOffset, yOffset)
    if xOffset == nil then
        xOffset = 0
    end
    if yOffset == nil then
        yOffset = 0
    end
    if rotation == nil then
        rotation = 0
    end

    return setmetatable(
        {
            image = image,
            x = x,
            y = y,
            rotation = rotation,
            xScale = xScale,
            yScale = yScale,
            xOffset = xOffset,
            yOffset = yOffset
        },
        ImageRenderer
    )
end

function ImageRenderer:draw()
    love.graphics.setColor(1, 1, 1)
    love.graphics.draw(self.image, self.x, self.y, self.rotation, self.xScale, self.yScale, self.xOffset, self.yOffset)
end

return ImageRenderer
