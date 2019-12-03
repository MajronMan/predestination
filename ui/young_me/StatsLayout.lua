local class = require("middleclass")

local StatsLayout = class("ui.young_me.StatsLayout")

function StatsLayout:initialize(model)
    self._model = model
end

function StatsLayout:frame(ui)
    if ui:windowBegin("Stats", 0, 0, 220, 110) then
        self:statLabel(ui, "HP", self._model:getHp(), self._model:getMaxHp(), "#ff4444")
        self:statLabel(ui, "MP", self._model:getMp(), self._model:getMaxMp(), "#4444ff")
        self:statLabel(ui, "IP", self._model:getIp(), self._model:getMaxIp(), "#ff44ff")
    end
    ui:windowEnd()
end

function StatsLayout:statLabel(ui, statName, statValue, statMaxValue, color)
    ui:layoutRow("dynamic", 30, 2)
    ui:label(statName .. ":", "left", color)
    ui:label(statValue .. " / " .. statMaxValue, "right", color)
end

return StatsLayout
