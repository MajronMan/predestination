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
    self._model = model
end

function PlayerController:getHp()
    return self._model.hp
end

function PlayerController:setHp(value, noClamp)
    if noClamp then
        self._model.hp = value
    else
        self._model.hp = lume.clamp(value, 0, self._model.maxHp)
    end
end

function PlayerController:getMp()
    return self._model.mp
end

function PlayerController:setMp(value, noClamp)
    if noClamp then
        self._model.mp = value
    else
        self._model.mp = lume.clamp(value, 0, self._model.maxMp)
    end
end

function PlayerController:getIp()
    return self._model.ip
end

function PlayerController:setIp(value, noClamp)
    if noClamp then
        self._model.ip = value
    else
        self._model.ip = lume.clamp(value, 0, self._model.maxIp)
    end
end

function PlayerController:getMaxHp()
    return self._model.maxHp
end

function PlayerController:getMaxMp()
    return self._model.maxMp
end

function PlayerController:getMaxIp()
    return self._model.maxIp
end

return PlayerController
