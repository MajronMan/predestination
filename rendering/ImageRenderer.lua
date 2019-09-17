local Class = require("hump.class")

local ImageRenderer =
    Class {
    init = function(self, image, x, y, rotation, xScale, yScale, xOffset, yOffset)
        if xOffset == nil then
            xOffset = 0
        end
        if yOffset == nil then
            yOffset = 0
        end
        if rotation == nil then
            rotation = 0
        end
        self.image = image
        self.x = x
        self.y = y
        self.rotation = rotation
        self.xScale = xScale
        self.yScale = yScale
        self.xOffset = xOffset
        self.yOffset = yOffset
    end,
    draw = function(self)
        love.graphics.setColor(1, 1, 1)
        love.graphics.draw(
            self.image,
            self.x,
            self.y,
            self.rotation,
            self.xScale,
            self.yScale,
            self.xOffset,
            self.yOffset
        )
    end
}

return ImageRenderer
