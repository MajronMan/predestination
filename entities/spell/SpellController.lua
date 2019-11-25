local class = require("middleclass")

local SpellModel = require("entities.spell.SpellModel")
local SpellView = require("entities.spell.SpellView")

local SpellController = class("entites.spell.SpellController")

function SpellController:initialize(ctx, model, view)
    self.model = model
    self.view = view
end

function SpellController:load(ctx, data)
    local sd = data
    local model = SpellModel(sd.mp, sd.name, sd.effect)
    local view = SpellView(model.name)
    return SpellController(ctx, model, view)
end

function SpellController:update(ui, state, dt)
    if (self.view:update(ui, state, dt)) then
        self:cast(ctx.player.model)
    end
end

function SpellController:cast(target)
    self.model.effect(target)
end

return SpellController
