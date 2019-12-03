local class = require("middleclass")

local StatsLayout = class("ui.young_me.StatsLayout")

function StatsLayout:initialize(model)
    self.model = model
end

function StatsLayout:frame(ui)
    if ui:windowBegin("Stats", 0, 0, 220, 110) then
        self:statLabel(ui, "HP", self.model:getHp(), self.model:getMaxHp(), "#ff4444")
        self:statLabel(ui, "MP", self.model:getMp(), self.model:getMaxMp(), "#4444ff")
        self:statLabel(ui, "IP", self.model:getIp(), self.model:getMaxIp(), "#ff44ff")
    end
    ui:windowEnd()
end

function StatsLayout:statLabel(ui, statName, statValue, statMaxValue, color)
    ui:layoutRow("dynamic", 30, 2)
    ui:label(statName .. ":", "left", color)
    ui:label(statValue .. " / " .. statMaxValue, "right", color)
end

return StatsLayout
