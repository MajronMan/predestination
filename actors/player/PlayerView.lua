local ImageRenderer = require("rendering.ImageRenderer")

local PlayerView = {}
PlayerView.__index = PlayerView

function PlayerView.new(x, y, width, height, image, rotation, xOffset, yOffset)
    return setmetatable(
        {
            renderer = ImageRenderer.new(
                image,
                x,
                y,
                rotation,
                width / image:getWidth(),
                height / image:getHeight(),
                xOffset,
                yOffset
            ),
            width = width,
            height = height
        },
        PlayerView
    )
end

function PlayerView:updatePosition(deltas)
    self.renderer.x = self.renderer.x + deltas.dx
    self.renderer.y = self.renderer.y + deltas.dy
end

function PlayerView:setPosition(x, y)
    self.renderer.x = x
    self.renderer.y = y
end

function PlayerView:getBoundingBox()
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
