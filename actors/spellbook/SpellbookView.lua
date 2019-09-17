local Class = require("hump.class")

local SpellbookView =
    Class {
    init = function(self, spells)
        self.spells = spells
    end,
    draw = function(self)
        for k, spell in pairs(self.spells) do
            print(k)
            spell.view:draw()
        end
    end
}

return SpellbookView
