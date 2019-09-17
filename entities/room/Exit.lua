local Class = require("hump.class")

local RectangleRenderer = require("rendering.RectangleRenderer")
local FontRenderer = require("rendering.FontRenderer")

local Exit =
    Class {
    init = function(self, to, x, y, w, h, color)
        self.to = to
        self.rectangleRenderer = RectangleRenderer(x, y, w, h, color)
        self.fontRenderer = FontRenderer(x + w / 4, y + h / 4, to)
    end,
    draw = function(self)
        self.rectangleRenderer:draw()
        self.fontRenderer:draw()
    end,
    getBoundingBox = function(self)
        return {
            x = self.rectangleRenderer.x,
            y = self.rectangleRenderer.y,
            width = self.rectangleRenderer.width,
            height = self.rectangleRenderer.height
        }
    end
}

return Exit
