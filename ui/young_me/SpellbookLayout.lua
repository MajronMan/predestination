local class = require("middleclass")

local Layout = require("ui.Layout")

local SpellbookLayout = class("ui.young_me.SpellbookLayout", Layout)

function SpellbookLayout:initialize(window, rBounds, spellbook, spellTarget)
    Layout.initialize(self, window, rBounds)
    self._spellbook = spellbook
    self._spellTarget = spellTarget
end

function SpellbookLayout:body(ui)
    if ui:groupBegin("Spellbook", "title") then
        ui:layoutRow("dynamic", 149, 1)
        for _, spell in ipairs(self._spellbook:getSpells()) do
            if ui:button(spell:getName()) then
                spell:cast(self._spellTarget)
            end
        end
        ui:groupEnd()
    end
end

return SpellbookLayout
