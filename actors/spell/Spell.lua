---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by Jakub Wilkosz.
--- DateTime: 14/09/2019 12:58
---

local Spell = {}
Spell.__index = Spell

local SpellModel = require("actors.spell.SpellModel")
local SpellView = require("actors.spell.SpellView")

function Spell.new(model, view)
    return setmetatable({ model = model, view = view }, Spell)
end

function Spell.load(spellData)
    local sd = spellData
    local icon = love.graphics.newImage(sd.image)
    local model = SpellModel.new(sd.mp, sd.name, sd.effect)
    local view = SpellView.new(
            sd.x,
            sd.y,
            sd.width,
            sd.height,
            icon,
            sd.rotation,
            sd.xOffset,
            sd.yOffset
    )
    return Spell.new(model, view)
end

function Spell:cast(target)
    this.model.effect(target)
end

return Spell