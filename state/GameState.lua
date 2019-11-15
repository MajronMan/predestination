local class = require("middleclass")

local map = require("assets.map")
-- local PlayerController = require("entities.player.PlayerController")
-- local SpellbookController = require("entities.spellbook.SpellbookController")

local GameState = class("state.GameState")

function GameState:initialize(data, playerModel, spellbookModel)
    self.player = playerModel
    self.currentRoomIndex = data.currentRoomIndex
    self.spellbook = spellbookModel
end

function GameState:getRoom()
    return map[self.currentRoomIndex]
end

return GameState
