local class = require("middleclass")
local lume = require("lume")

local HpEvent = class("events.HpEvent")

function HpEvent.static:load(ctx, data)
    return HpEvent(ctx, data.hpDelta, data.title, data.text)
end

function HpEvent:initialize(ctx, hpDelta, title, text)
    self._ctx = ctx
    self._hpDelta = hpDelta
    self._title = title
    self._text = text
    self._triggered = false
end

function HpEvent:trigger()
    local target = self._ctx.player
    target:setHp(target:getHp() + self._hpDelta)
    self._triggered = true
end

function HpEvent:isTriggered()
    return self._triggered
end

return HpEvent
