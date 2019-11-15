local class = require("middleclass")

local SpellModel = require("entities.spell.SpellModel")
local SpellView = require("entities.spell.SpellView")

local SpellController = class("entites.spell.SpellController")

function SpellController:load(spellData)
    local sd = spellData
    local icon = love.graphics.newImage(sd.image)
    local model = SpellModel(sd.mp, sd.name, sd.effect)
    local view = SpellView(sd.x, sd.y, sd.width, sd.height, icon, sd.rotation, sd.xOffset, sd.yOffset)
    return SpellController(model, view)
end

function SpellController:initialize(model, view)
    self.model = model
    self.view = view
end

function SpellController:cast(target)
    self.model.effect(target)
end

return SpellController
