local Class = require("hump.class")

local SpellModel = require("actors.spell.SpellModel")
local SpellView = require("actors.spell.SpellView")

local Spell =
    Class {
    load = function(Self, spellData)
        local sd = spellData
        local icon = love.graphics.newImage(sd.image)
        local model = SpellModel(sd.mp, sd.name, sd.effect)
        local view = SpellView(sd.x, sd.y, sd.width, sd.height, icon, sd.rotation, sd.xOffset, sd.yOffset)
        return Self(model, view)
    end,
    init = function(self, model, view)
        self.model = model
        self.view = view
    end,
    cast = function(self, target)
        self.model.effect(target)
    end
}

return Spell
