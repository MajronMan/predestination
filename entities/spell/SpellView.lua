local Class = require("hump.class")

local ImageRenderer = require("rendering.ImageRenderer")

local SpellView =
    Class {
    init = function(self, x, y, width, height, image, rotation, xOffset, yOffset)
        self.renderer =
            ImageRenderer(image, x, y, rotation, width / image:getWidth(), height / image:getHeight(), xOffset, yOffset)
        self.width = width
        self.height = height
    end,
    draw = function(self)
        self.renderer:draw()
    end,
    getBoundingBox = function(self)
        return {
            x = self.renderer.x,
            y = self.renderer.y,
            width = self.width,
            height = self.height
        }
    end
}

return SpellView
