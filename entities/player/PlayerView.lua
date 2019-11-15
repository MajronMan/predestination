local class = require("middleclass")

local ImageRenderer = require("rendering.ImageRenderer")

local PlayerView = class("entities.player.PlayerView")

function PlayerView:initialize(x, y, width, height, image, rotation, xOffset, yOffset)
    self.renderer =
        ImageRenderer(image, x, y, rotation, width / image:getWidth(), height / image:getHeight(), xOffset, yOffset)
    self.width = width
    self.height = height
end

function PlayerView:updatePosition(deltas)
    self.renderer.x = self.renderer.x + deltas.dx
    self.renderer.y = self.renderer.y + deltas.dy
end

function PlayerView:setPosition(x, y)
    self.renderer.x = x
    self.renderer.y = y
end

function PlayerView:getBoundingBox(x, y)
    return {
        x = self.renderer.x,
        y = self.renderer.y,
        width = self.width,
        height = self.height
    }
end

function PlayerView:draw()
    self.renderer:draw()
end

return PlayerView
