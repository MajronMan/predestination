local map = require("assets.map")
local Player = require("actors.player.Player")

local GameState = {}
GameState.__index = GameState

function GameState:new(data)
    return setmetatable(
        {
            player = Player.load(data.player),
            currentRoomIndex = data.currentRoomIndex
        },
        self
    )
end

function GameState:getRoom()
    return map[self.currentRoomIndex]
end

return GameState
