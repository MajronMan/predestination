local class = require("middleclass")

local HpEvent = class("entities.event.HpEvent")

function HpEvent:initialize(hpDelta, title, text)
    self.hpDelta = hpDelta
    self.title = title
    self.text = text
end

function HpEvent:load(ctx, data)
    return HpEvent(data.hpDelta, data.title, data.text)
end

function HpEvent:trigger(target)
    love.window.showMessageBox(self.title, self.text, "info")
    target.hp = math.max(0, math.min(target.hp + self.hpDelta, target.maxHp))
end

return HpEvent
