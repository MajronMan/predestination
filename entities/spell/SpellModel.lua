local class = require("middleclass")

local SpellModel = class("entities.spell.SpellModel")

function SpellModel:initialize(mp, name, effect, targets)
    self.mp = mp
    self.name = name
    self.effect = effect
    self.targets = targets
end

return SpellModel
