local RectangleRenderer = {}

RectangleRenderer.__index = RectangleRenderer

function RectangleRenderer.new(x, y, w, h, color)
    return setmetatable(
        {
            x = x,
            y = y,
            width = w,
            height = h,
            color = color
        },
        RectangleRenderer
    )
end

function RectangleRenderer:draw()
    love.graphics.setColor(self.color)
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end

return RectangleRenderer
