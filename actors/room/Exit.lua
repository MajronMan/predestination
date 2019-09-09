local RectangleRenderer = require("rendering.RectangleRenderer")
local FontRenderer = require("rendering.FontRenderer")

local Exit = {}

Exit.__index = Exit

function Exit.new(to, x, y, w, h, color)
    return setmetatable(
        {
            to = to,
            rectangleRenderer = RectangleRenderer.new(x, y, w, h, color),
            fontRenderer = FontRenderer.new(to, x + w / 4, y + h / 4)
        },
        Exit
    )
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
