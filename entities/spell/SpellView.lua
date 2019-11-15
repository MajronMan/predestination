local class = require("middleclass")

local ImageRenderer = require("rendering.ImageRenderer")

local SpellView = class("entities.spell.SpellView")

function SpellView:initialize(x, y, width, height, image, rotation, xOffset, yOffset)
    self.renderer =
        ImageRenderer(image, x, y, rotation, width / image:getWidth(), height / image:getHeight(), xOffset, yOffset)
    self.width = width
    self.height = height
end

function SpellView:draw()
    self.renderer:draw()
end

function SpellView:getBoundingBox()
    return {
        x = self.renderer.x,
        y = self.renderer.y,
        width = self.width,
        height = self.height
    }
end

return SpellView
