local class = require("middleclass")

local RectangleRenderer = require("rendering.RectangleRenderer")
local FontRenderer = require("rendering.FontRenderer")

local Exit = class("entities.room.Exit")

function Exit:initialize(to, x, y, w, h, color)
    self.to = to
    self.rectangleRenderer = RectangleRenderer(x, y, w, h, color)
    self.fontRenderer = FontRenderer(x + w / 4, y + h / 4, to)
end

function Exit:draw()
    self.rectangleRenderer:draw()
    self.fontRenderer:draw()
end

function Exit:getBoundingBox()
    return {
        x = self.rectangleRenderer.x,
        y = self.rectangleRenderer.y,
        width = self.rectangleRenderer.width,
        height = self.rectangleRenderer.height
    }
end

return Exit
