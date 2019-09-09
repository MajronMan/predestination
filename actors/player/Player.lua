local PlayerModel = require("actors.player.PlayerModel")
local PlayerView = require("actors.player.PlayerView")

local Player = {}
Player.__index = Player

function Player.new(model, view)
    return setmetatable({model = model, view = view}, Player)
end

function Player.load(playerData)
    local d = playerData
    local image = love.graphics.newImage(d.image)

    local model = PlayerModel.new(d.speed, d.hp, d.mp, d.ip, d.hp, d.mp, d.ip)
    local view =
        PlayerView.new(
        (love.graphics.getWidth() - d.width) / 2,
        (love.graphics.getHeight() - d.height) / 2,
        d.width,
        d.height,
        image,
        d.rotation,
        d.xOffset,
        d.yOffset
    )
    return Player.new(model, view)
end

function Player:update(dt)
    local dl = self.model.speed * dt
    self.view:updatePosition(self:handleKeyboard(dl))

    if self.model.hp == 0 then
        love.window.showMessageBox("GAME OVER", "You died! Poor princess...", "info")
        love.load()
    end
end

function Player:handleKeyboard(dl)
    local dx = 0
    local dy = 0
    local box = self.view:getBoundingBox()

    if love.keyboard.isDown("d") and box.x < love.graphics.getWidth() - box.width then
        dx = dl
    end
    if love.keyboard.isDown("a") and box.x > 0 then
        dx = -dl
    end
    if love.keyboard.isDown("w") and box.y > 0 then
        dy = -dl
    end
    if love.keyboard.isDown("s") and box.y < love.graphics.getHeight() - box.height then
        dy = dl
    end
    return {dx = dx, dy = dy}
end

function Player:draw()
    self.view:draw()
end

function Player:nextRoom()
    local box = self.view:getBoundingBox()
    self.view:setPosition((love.graphics.getWidth() - box.width) / 2, (love.graphics.getHeight() - box.height) / 2)
end

function Player:getBoundingBox()
    return self.view:getBoundingBox()
end

function Player:getStats()
    return {
        hp = self.model.hp,
        mp = self.model.mp,
        ip = self.model.ip,
        maxHp = self.model.maxHp,
        maxMp = self.model.maxMp,
        maxIp = self.model.maxIp
    }
end

return Player
