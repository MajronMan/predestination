local class = require("middleclass")

local MapController = require("entities.map.MapController")
local PlayerController = require("entities.player.PlayerController")
local SpellbookController = require("entities.spellbook.SpellbookController")

local ContextController = class("entities.ContextController")

function ContextController.static:load(data)
    local ctx = ContextController()
    ctx.map = MapController:load(ctx, data.map)
    ctx.player = PlayerController:load(ctx, data.player)
    ctx.spellbook = SpellbookController:load(ctx, data.spellbook)
    return ctx
end

function ContextController:update(ui, state, dt)
    self.player:update(state, dt)
    self.spellbook:update(ui, state, dt)
end

function ContextController:draw()
    self.player:draw()
end

return ContextController
