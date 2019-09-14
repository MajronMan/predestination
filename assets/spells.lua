---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by Jakub Wilkosz.
--- DateTime: 14/09/2019 13:10
---
local Spell = require("actors.spell.Spell")

local spells = {}

table.insert(spells, {
    width = 32,
    height = 32,
    image = "assets/images/player.png",
    xOffset = 0,
    yOffset = 16,
    x = 100,
    y = 100,
    name = 'Heal',
    mp = 10,
    effect = function(target)
        target.hp = target.hp + 10
    end
})

table.insert(spells, {
    x = 50,
    y = 50,
    width = 32,
    height = 32,
    image = "assets/images/player.png",
    xOffset = 0,
    yOffset = 16,
    name = 'Restore Mana',
    mp = 0,
    effect = function(target)
        target.mp = target.mp + 10
    end
})


return spells