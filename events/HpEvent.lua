local class = require("middleclass")
local lume = require("lume")

local HpEvent = class("events.HpEvent")

function HpEvent.static:load(ctx, data)
    return HpEvent(ctx, data.hpDelta, data.title, data.text)
end

function HpEvent:initialize(ctx, hpDelta, title, text)
    self.ctx = ctx
    self.hpDelta = hpDelta
    self.title = title
    self.text = text
    self.triggered = false
end

function HpEvent:trigger()
    local target = self.ctx.player.model
    target.hp = lume.clamp(target.hp + self.hpDelta, 0, target.maxHp)
    self.triggered = true
end

return HpEvent
