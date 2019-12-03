local class = require("middleclass")
local lume = require("lume")

local PlayerModel = require("entities.player.PlayerModel")

local PlayerController = class("entities.player.PlayerController")

function PlayerController.static:load(ctx, data)
    local d = data
    local model = PlayerModel(d.hp, d.mp, d.ip, d.maxHp, d.maxMp, d.maxIp)
    return PlayerController(model)
end

function PlayerController:initialize(model)
    self.model = model
end

function PlayerController:getHp()
    return self.model.hp
end

function PlayerController:setHp(value, noClamp)
    if noClamp then
        self.model.hp = value
    else
        self.model.hp = lume.clamp(value, 0, self.model.maxHp)
    end
end

function PlayerController:getMp()
    return self.model.mp
end

function PlayerController:setMp(value, noClamp)
    if noClamp then
        self.model.mp = value
    else
        self.model.mp = lume.clamp(value, 0, self.model.maxMp)
    end
end

function PlayerController:getIp()
    return self.model.ip
end

function PlayerController:setIp(value, noClamp)
    if noClamp then
        self.model.ip = value
    else
        self.model.ip = lume.clamp(value, 0, self.model.maxIp)
    end
end

function PlayerController:getMaxHp()
    return self.model.maxHp
end

function PlayerController:getMaxMp()
    return self.model.maxMp
end

function PlayerController:getMaxIp()
    return self.model.maxIp
end

return PlayerController
