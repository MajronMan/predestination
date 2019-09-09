local RectangleRenderer = require("rendering.RectangleRenderer")
local RoomView = {}
RoomView.__index = RoomView

function RoomView.new()
    return setmetatable(
        {
            renderer = RectangleRenderer.new(
                0,
                love.graphics.getHeight(),
                love.graphics.getWidth(),
                love.graphics.getHeight(),
                {0, 0, 0, 1}
            )
        },
        RoomView
    )
end

function RoomView:draw()
    self.renderer:draw()
end

return RoomView
