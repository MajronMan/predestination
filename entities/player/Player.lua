local Class = require("hump.class")

local PlayerModel = require("entities.player.PlayerModel")
local PlayerView = require("entities.player.PlayerView")

local Player =
    Class {
    init = function(self, model, view)
        self.model = model
        self.view = view
    end,
    load = function(Self, playerData)
        local d = playerData
        local image = love.graphics.newImage(d.image)

        local model = PlayerModel(d.speed, d.hp, d.mp, d.ip, d.hp, d.mp, d.ip)
        local view =
            PlayerView(
            (love.graphics.getWidth() - d.width) / 2,
            (love.graphics.getHeight() - d.height) / 2,
            d.width,
            d.height,
            image,
            d.rotation,
            d.xOffset,
            d.yOffset
        )
        return Self(model, view)
    end,
    update = function(self, dt)
        local dl = self.model.speed * dt
        self.view:updatePosition(self:handleKeyboard(dl))

        if self.model.hp == 0 then
            love.window.showMessageBox("GAME OVER", "You died! Poor princess...", "info")
            love.load()
        end
    end,
    handleKeyboard = function(self, dl)
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
    end,
    draw = function(self)
        self.view:draw()
    end,
    nextRoom = function(self)
        local box = self.view:getBoundingBox()
        self.view:setPosition((love.graphics.getWidth() - box.width) / 2, (love.graphics.getHeight() - box.height) / 2)
    end,
    getBoundingBox = function(self)
        return self.view:getBoundingBox()
    end,
    getStats = function(self)
        return {
            hp = self.model.hp,
            mp = self.model.mp,
            ip = self.model.ip,
            maxHp = self.model.maxHp,
            maxMp = self.model.maxMp,
            maxIp = self.model.maxIp
        }
    end
}

return Player
