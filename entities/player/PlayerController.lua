local class = require("middleclass")

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

return PlayerController
