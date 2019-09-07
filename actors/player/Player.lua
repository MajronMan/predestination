local BaseController = require("actors.BaseController")
local PlayerModel = require("actors.player.PlayerModel")
local PlayerView = require("actors.player.PlayerView")

local Player = BaseController:new()

function Player:load(data)
    local d = data.player
    local image = love.graphics.newImage(d.image)

    local model =
        PlayerModel:new(
        (love.graphics.getWidth() - d.width) / 2,
        (love.graphics.getHeight() - d.height) / 2,
        d.width,
        d.height,
        d.speed,
        d.hp,
        d.mp,
        d.ip,
        d.hp,
        d.mp,
        d.ip
    )
    local view =
        PlayerView:new(
        image,
        d.rotation,
        d.width / image:getWidth(),
        d.height / image:getHeight(),
        d.xOffset,
        d.yOffset
    )
    return Player:new(model, view)
end

function Player:update(dt)
    local dx = self.model.speed * dt
    if love.keyboard.isDown("d") and self.model.x < love.graphics.getWidth() - self.model.width then
        self.model.x = self.model.x + dx
    end
    if love.keyboard.isDown("a") and self.model.x > 0 then
        self.model.x = self.model.x - dx
    end
    if love.keyboard.isDown("w") and self.model.y > 0 then
        self.model.y = self.model.y - dx
    end
    if love.keyboard.isDown("s") and self.model.y < love.graphics.getHeight() - self.model.height then
        self.model.y = self.model.y + dx
    end
end

function Player:draw()
    love.graphics.draw(
        self.view.image,
        self.model.x,
        self.model.y,
        self.view.rotation,
        self.view.xScale,
        self.view.yScale,
        self.view.xOffset,
        self.view.yOffset
    )
end

return Player
