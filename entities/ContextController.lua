local class = require("middleclass")

local PlayerController = require("entities.player.PlayerController")
local SpellbookController = require("entities.spellbook.SpellbookController")

local ContextController = class("entities.ContextController")

function ContextController.static:load(data)
    local ctx = ContextController()
    ctx.player = PlayerController:load(ctx, data.player)
    ctx.spellbook = SpellbookController:load(ctx, data.spells)
    return ctx
end

function ContextController:update(state, dt)
    self.player:update(state, dt)
end

function ContextController:draw()
    self.player:draw()
    self.spellbook:draw()
end

function ContextController:mousepressed(x, y, button, istouch, presses)
    self.spellbook:mousepressed(x, y, button, istouch, presses)
end

return ContextController
