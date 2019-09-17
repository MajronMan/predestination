local Class = require("hump.class")

local ImageRenderer = require("rendering.ImageRenderer")

local PlayerView =
    Class {
    init = function(self, x, y, width, height, image, rotation, xOffset, yOffset)
        self.renderer =
            ImageRenderer(image, x, y, rotation, width / image:getWidth(), height / image:getHeight(), xOffset, yOffset)
        self.width = width
        self.height = height
    end,
    updatePosition = function(self, deltas)
        self.renderer.x = self.renderer.x + deltas.dx
        self.renderer.y = self.renderer.y + deltas.dy
    end,
    setPosition = function(self, x, y)
        self.renderer.x = x
        self.renderer.y = y
    end,
    getBoundingBox = function(self, x, y)
        return {
            x = self.renderer.x,
            y = self.renderer.y,
            width = self.width,
            height = self.height
        }
    end,
    draw = function(self)
        self.renderer:draw()
    end
}

return PlayerView
