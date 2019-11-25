local class = require("middleclass")

local SpellModel = class("entities.spell.SpellModel")

function SpellModel:initialize(mp, name, effect)
    self.mp = mp
    self.name = name
    self.effect = effect
end

return SpellModel
