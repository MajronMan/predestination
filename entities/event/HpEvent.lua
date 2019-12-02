local class = require("middleclass")

local HpEvent = class("entities.event.HpEvent")

function HpEvent:initialize(ctx, hpDelta, title, text)
    self.ctx = ctx
    self.hpDelta = hpDelta
    self.title = title
    self.text = text
    self.triggered = false
end

function HpEvent:load(ctx, data)
    return HpEvent(ctx, data.hpDelta, data.title, data.text)
end

function HpEvent:trigger()
    local target = self.ctx.player.model
    target.hp = math.max(0, math.min(target.hp + self.hpDelta, target.maxHp))
    self.triggered = true
end

return HpEvent
