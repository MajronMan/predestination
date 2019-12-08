local class = require("middleclass")

local Layout = require("ui.Layout")

local SpellbookLayout = class("ui.young_me.SpellbookLayout", Layout)

function SpellbookLayout:initialize(bounds, model)
    Layout.initialize(self, bounds)
    self._model = model
end

function SpellbookLayout:body(ui)
    if ui:groupBegin("Spellbook", "title") then
        ui:layoutRow("dynamic", 149, 1)
        for _, spell in ipairs(self._model:getSpells()) do
            if ui:button(spell:getName()) then
                spell:cast(ctx.player)
            end
        end
        ui:groupEnd()
    end
end

return SpellbookLayout
