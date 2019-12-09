local class = require("middleclass")

local Group = require("ui.Group")

local StatsGroup = class("ui.young_me.StatsGroup", Group)

function StatsGroup:initialize(window, rBounds, model)
    Group.initialize(self, window, "Stats", rBounds)
    self._model = model
end

function StatsGroup:body(ui)
    self:statLabel(ui, "HP", self._model:getHp(), self._model:getMaxHp(), "#ff4444")
    self:statLabel(ui, "MP", self._model:getMp(), self._model:getMaxMp(), "#4444ff")
    self:statLabel(ui, "IP", self._model:getIp(), self._model:getMaxIp(), "#ff44ff")
end

function StatsGroup:statLabel(ui, statName, statValue, statMaxValue, color)
    ui:layoutRow("dynamic", 30, 2)
    ui:label(statName .. ":", "left", color)
    ui:label(statValue .. " / " .. statMaxValue, "right", color)
end

return StatsGroup
