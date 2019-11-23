local class = require("middleclass")

local SpellController = require("entities.spell.SpellController")
local isColliding = require("utils.collisions").isColliding

local SpellbookController = class("entities.spellbook.SpellbookController")

function SpellbookController:initialize(ctx, spells)
    self.ctx = ctx
    self.spells = spells
end

function SpellbookController.static:load(ctx, data)
    local spells = {}
    for i, spell in ipairs(data) do
        table.insert(spells, SpellController:load(ctx, i, spell))
    end
    return SpellbookController(ctx, spells)
end

function SpellbookController:update(ui, state, dt)
    for _, spell in pairs(self.spells) do
        spell:update(ui, state, dt)
    end
end

return SpellbookController
