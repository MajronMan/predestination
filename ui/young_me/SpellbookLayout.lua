local class = require("middleclass")

local SpellbookLayout = class("ui.young_me.SpellbookLayout")

function SpellbookLayout:initialize(model)
    self._model = model
end

function SpellbookLayout:frame(ui)
    ui:layoutSpacePush(0, 0.1, 0.15, 0.9)
    if ui:groupBegin("Spellbook", "title") then
        ui:layoutRow("dynamic", 149, 1)
        for _, spell in pairs(self._model:getSpells()) do
            if ui:button(spell:getName()) then
                spell:cast(ctx.player)
            end
        end
        ui:groupEnd()
    end
end

return SpellbookLayout
