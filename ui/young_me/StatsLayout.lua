local class = require("middleclass")

local StatsLayout = class("ui.young_me.StatsLayout")

function StatsLayout:initialize(model)
    self.model = model
end

function StatsLayout:frame(ui)
    if ui:windowBegin("Stats", 0, 0, 220, 110) then
        self:statLabel(ui, "HP", self.model.hp, self.model.maxHp, "#ff4444")
        self:statLabel(ui, "MP", self.model.mp, self.model.maxMp, "#4444ff")
        self:statLabel(ui, "IP", self.model.ip, self.model.maxIp, "#ff44ff")
    end
    ui:windowEnd()
end

function StatsLayout:statLabel(ui, statName, statValue, statMaxValue, color)
    ui:layoutRow("dynamic", 30, 2)
    ui:label(statName .. ":", "left", color)
    ui:label(statValue .. " / " .. statMaxValue, "right", color)
end

return StatsLayout
