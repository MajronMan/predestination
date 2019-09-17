local Class = require("hump.class")

local RectangleRenderer =
    Class {
    init = function(self, x, y, w, h, color)
        self.x = x
        self.y = y
        self.width = w
        self.height = h
        self.color = color
    end,
    draw = function(self)
        love.graphics.setColor(self.color)
        love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
    end
}

return RectangleRenderer
