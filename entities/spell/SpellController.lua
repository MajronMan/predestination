local class = require("middleclass")

local SpellModel = require("entities.spell.SpellModel")

local SpellController = class("entites.spell.SpellController")

function SpellController:initialize(model)
    self.model = model
end

function SpellController:load(ctx, data)
    return SpellController(SpellModel(data.name, data.effect))
end

function SpellController:cast(target)
    self.model.effect(target)
end

return SpellController
