local class = require("middleclass")

local SpellbookView = class("entities.spellbook.SpellbookView")

function SpellbookView:initialize(spells)
    self.spells = spells
end

function SpellbookView:draw()
    for k, spell in pairs(self.spells) do
        spell.view:draw()
    end
end

return SpellbookView
