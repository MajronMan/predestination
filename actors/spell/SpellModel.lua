---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by Jakub Wilkosz.
--- DateTime: 14/09/2019 13:03
---

local SpellModel = {}
SpellModel.__index = SpellModel

function SpellModel.new(mp, name, effect, targets)
    return setmetatable(
            {
                mp = mp,
                name = name,
                effect = effect,
                targets = targets
            },
            self
    )
end

return SpellModel