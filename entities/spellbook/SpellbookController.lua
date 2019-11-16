local class = require("middleclass")

local SpellbookView = require("entities.spellbook.SpellbookView")
local SpellController = require("entities.spell.SpellController")
local isColliding = require("utils.collisions").isColliding

local SpellbookController = class("entities.spellbook.SpellbookController")

function SpellbookController:load(spellbookData, player)
    local spells = {}
    for k, spell in pairs(spellbookData) do
        table.insert(spells, SpellController:load(spell))
    end
    return SpellbookController(spells, SpellbookView(spells), player)
end

function SpellbookController:mousepressed(x, y, button, istouch, presses)
    local spell = spellbook:getUsedSpell(x, y)
    if spell ~= nil then
        spell:cast(player)
    end
end

function SpellbookController:initialize(spells, view, player)
    self.spells = spells
    self.view = view
    self.player = player
end

function SpellbookController:draw()
    self.view:draw()
end

function SpellbookController:getUsedSpell(x, y)
    for k, spell in pairs(self.spells) do
        if isColliding({x = x, y = y}, spell.view:getBoundingBox()) then
            return spell
        end
    end
    return nil
end

return SpellbookController
