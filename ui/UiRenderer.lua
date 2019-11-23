local class = require("middleclass")

local UiRenderer = class("ui.UiRenderer")

function UiRenderer:initialize(ctx)
    self.ctx = ctx
end

function UiRenderer:frame(ui)
    if ui:windowBegin("Stats", 0, 0, 220, 110) then
        ui:layoutRow("dynamic", 30, 2)
        ui:label("HP:", "left", "#ff4444")
        ui:label(self.ctx.player.model.hp .. " / " .. self.ctx.player.model.maxHp, "right", "#ff4444")
        ui:label("MP:", "left", "#4444ff")
        ui:label(self.ctx.player.model.mp .. " / " .. self.ctx.player.model.maxMp, "right", "#4444ff")
        ui:label("IP:", "left", "#ff44ff")
        ui:label(self.ctx.player.model.ip .. " / " .. self.ctx.player.model.maxIp, "right", "#ff44ff")
    end
    ui:windowEnd()

    if ui:windowBegin("Menu", 1700, 0, 220, 1080) then
        ui:layoutRow("dynamic", 175, 1)
        ui:button("Minimap")
        ui:button("Inventory")
        ui:button("Spells")
        ui:button("Collectables")
        ui:button("Battle Stats")
        ui:button("Options")
    end
    ui:windowEnd()

    if ui:windowBegin("Room", 200, 125, 1400, 700, "title") then
    end
    ui:windowEnd()

    if ui:windowBegin("Context Menu", 200, 840, 1400, 225, "title") then
        ui:layoutRow("dynamic", 172, 6)
        for _, spell in pairs(self.ctx.spellbook.spells) do
            if ui:button(spell.model.name) then
                spell:cast(self.ctx.player.model)
            end
        end
    end
    ui:windowEnd()
end

return UiRenderer
