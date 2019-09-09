local HpEvent = {}
HpEvent.__index = HpEvent

function HpEvent.new(hpDelta, target)
    local text
    local title
    if hpDelta < 0 then
        title = "BOOOOOM!"
        text = "YOU FOOL, IT WAS A TRAP!"
    else
        title = "AW YEAAAH!"
        text = "YOU FOUND A FALAFEL AND FEEL BETTER RIGHT AFTER EATING IT!"
    end
    return setmetatable(
        {
            hpDelta = hpDelta,
            target = target,
            title = title,
            text = text
        },
        HpEvent
    )
end

function HpEvent:trigger(target)
    love.window.showMessageBox(self.title, self.text, "info")
    target.hp = math.max(0, math.min(target.hp + self.hpDelta, target.maxHp))
end

return HpEvent
