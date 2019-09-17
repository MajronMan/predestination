local Class = require("hump.class")

local SpellbookView = require("actors.spellbook.SpellbookView")
local Spell = require("actors.spell.Spell")
local isColliding = require("utils.collisions").isColliding

local Spellbook =
    Class {
    load = function(Self, spellbookData)
        local spells = {}
        for k, spell in pairs(spellbookData) do
            table.insert(spells, Spell:load(spell))
        end
        return Self(spells, SpellbookView(spells))
    end,
    init = function(self, spells, view)
        self.spells = spells
        self.view = view
    end,
    draw = function(self)
        self.view:draw()
    end,
    getUsedSpell = function(self, x, y)
        for k, spell in pairs(self.spells) do
            if isColliding({x = x, y = y}, spell.view:getBoundingBox()) then
                return spell
            end
        end
        return nil
    end
}

return Spellbook
