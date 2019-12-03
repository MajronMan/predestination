local class = require("middleclass")

local SpellModel = require("entities.spell.SpellModel")

local SpellController = class("entites.spell.SpellController")

function SpellController.static:load(ctx, data)
    return SpellController(SpellModel(data.name, data.effect))
end

function SpellController:initialize(model)
    self._model = model
end

function SpellController:cast(target)
    self._model.effect(target)
end

function SpellController:getName()
    return self._model.name
end

return SpellController
