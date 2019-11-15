local class = require("middleclass")

local RectangleRenderer = class("rendering.RectangleRenderer")

function RectangleRenderer:initialize(x, y, w, h, color)
    self.x = x
    self.y = y
    self.width = w
    self.height = h
    self.color = color
end

function RectangleRenderer:draw()
    love.graphics.setColor(self.color)
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end

return RectangleRenderer
