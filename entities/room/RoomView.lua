local class = require("middleclass")

local RectangleRenderer = require("rendering.RectangleRenderer")

local RoomView = class("entities.room.RoomView")

function RoomView:initialize()
    self.renderer =
        RectangleRenderer(
        0,
        love.graphics.getHeight(),
        love.graphics.getWidth(),
        love.graphics.getHeight(),
        {0, 0, 0, 1}
    )
end

function RoomView:draw()
    self.renderer:draw()
end

return RoomView
