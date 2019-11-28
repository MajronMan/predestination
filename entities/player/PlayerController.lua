local class = require("middleclass")

local PlayerModel = require("entities.player.PlayerModel")

local PlayerController = class("entities.player.PlayerController")

function PlayerController:initialize(model)
    self.model = model
end

function PlayerController.static:load(ctx, data)
    local d = data
    local model = PlayerModel(d.hp, d.mp, d.ip, d.hp, d.mp, d.ip)
    return PlayerController(model)
end

function PlayerController:update(state, dt)
    if self.model.hp == 0 then
        love.window.showMessageBox("GAME OVER", "You died! Poor princess...", "info")
        love.load()
    end
end

return PlayerController
