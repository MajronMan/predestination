local class = require("middleclass")

local SpellModel = class("entities.spell.SpellModel")

function SpellModel:initialize(name, effect)
    self.name = name
    self.effect = effect
end

return SpellModel
