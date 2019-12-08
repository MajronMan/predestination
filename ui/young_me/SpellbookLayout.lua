local class = require("middleclass")

local SpellbookLayout = class("ui.young_me.SpellbookLayout")

function SpellbookLayout:initialize(bounds, model)
    self._bounds = bounds
    self._model = model
end

function SpellbookLayout:frame(ui)
    ui:layoutSpacePush(unpack(self._bounds))
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
