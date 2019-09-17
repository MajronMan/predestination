local Class = require("hump.class")

local RectangleRenderer = require("rendering.RectangleRenderer")

local RoomView =
    Class {
    init = function(self)
        self.renderer =
            RectangleRenderer(
            0,
            love.graphics.getHeight(),
            love.graphics.getWidth(),
            love.graphics.getHeight(),
            {0, 0, 0, 1}
        )
    end,
    draw = function(self)
        self.renderer:draw()
    end
}

return RoomView
