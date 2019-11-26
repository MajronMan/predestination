local class = require("middleclass")

local StatsWidget = class("ui.young_me.StatsWidget")

function StatsWidget:initialize(model)
    self.model = model
end

function StatsWidget:frame(ui)
    if ui:windowBegin("Stats", 0, 0, 220, 110) then
        ui:layoutRow("dynamic", 30, 2)
        ui:label("HP:", "left", "#ff4444")
        ui:label(self.model.hp .. " / " .. self.model.maxHp, "right", "#ff4444")
        ui:label("MP:", "left", "#4444ff")
        ui:label(self.model.mp .. " / " .. self.model.maxMp, "right", "#4444ff")
        ui:label("IP:", "left", "#ff44ff")
        ui:label(self.model.ip .. " / " .. self.model.maxIp, "right", "#ff44ff")
    end
    ui:windowEnd()
end

return StatsWidget
