local class = require("middleclass")

local SpellController = require("entities.spell.SpellController")

local SpellbookController = class("entities.spellbook.SpellbookController")

function SpellbookController.static:load(ctx, data)
    local spells = {}
    for _, spell in ipairs(data) do
        table.insert(spells, SpellController:load(ctx, spell))
    end
    return SpellbookController(spells)
end

function SpellbookController:initialize(spells)
    self._spells = spells
end

function SpellbookController:getSpells()
    return self._spells
end

return SpellbookController
