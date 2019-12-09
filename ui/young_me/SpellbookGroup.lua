local class = require("middleclass")

local Group = require("ui.Group")

local SpellbookGroup = class("ui.young_me.SpellbookGroup", Group)

function SpellbookGroup:initialize(window, title, rBounds, spellbook, spellTarget)
    Group.initialize(self, window, title, rBounds, {"title"})
    self._spellbook = spellbook
    self._spellTarget = spellTarget
end

function SpellbookGroup:body(ui)
    ui:layoutRow("dynamic", 149, 1)
    for _, spell in ipairs(self._spellbook:getSpells()) do
        if ui:button(spell:getName()) then
            spell:cast(self._spellTarget)
        end
    end
end

return SpellbookGroup
