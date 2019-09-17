local Class = require("hump.class")

local map = require("assets.map")
local Player = require("entities.player.Player")
local Spellbook = require("entities.spellbook.Spellbook")

local GameState =
    Class {
    init = function(self, data)
        self.player = Player:load(data.player)
        self.currentRoomIndex = data.currentRoomIndex
        self.spellbook = Spellbook:load(data.spells)
    end,
    getRoom = function(self)
        return map[self.currentRoomIndex]
    end
}

return GameState
