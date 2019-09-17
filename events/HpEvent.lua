local Class = require("hump.class")

local HpEvent =
    Class {
    init = function(self, hpDelta, target)
        local text
        local title
        if hpDelta < 0 then
            title = "BOOOOOM!"
            text = "YOU FOOL, IT WAS A TRAP!"
        else
            title = "AW YEAAAH!"
            text = "YOU FOUND A FALAFEL AND FEEL BETTER RIGHT AFTER EATING IT!"
        end
        self.hpDelta = hpDelta
        self.target = target
        self.title = title
        self.text = text
    end,
    trigger = function(self, target)
        love.window.showMessageBox(self.title, self.text, "info")
        target.hp = math.max(0, math.min(target.hp + self.hpDelta, target.maxHp))
    end
}

return HpEvent
