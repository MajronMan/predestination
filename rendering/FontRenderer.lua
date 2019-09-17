local Class = require("hump.class")

local FontRenderer =
    Class {
    init = function(self, x, y, text, color, font)
        if color == nil then
            color = {0, 0, 0, 1}
        end
        self.x = x
        self.y = y
        self.text = text
        self.color = color
        self.font = font
    end,
    draw = function(self)
        love.graphics.setColor(self.color)
        local oldFont = love.graphics.getFont()
        if self.font then
            love.graphics.setFont(self.font)
        end
        love.graphics.print(self.text, self.x, self.y)
        if self.font then
            love.graphics.setFont(oldFont)
        end
    end
}

return FontRenderer
