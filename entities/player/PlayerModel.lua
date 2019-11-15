local class = require("middleclass")

local PlayerModel = class("entities.player.PlayerModel")

function PlayerModel:initialize(speed, hp, mp, ip, maxHp, maxMp, maxIp)
    self.speed = speed
    self.hp = hp
    self.mp = mp
    self.ip = ip
    self.maxHp = maxHp
    self.maxMp = maxMp
    self.maxIp = maxIp
end

return PlayerModel
