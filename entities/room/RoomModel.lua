local class = require("middleclass")

local Exit = require("entities.room.Exit")

local RoomModel = class("entities.room.RoomModel")

function RoomModel:initialize(index, exits, event)
    local drawableExits = {}
    for i, to in ipairs(exits) do
        drawableExits[i] = Exit(to, 200 * i, 0, 100, 100, {1 - to / 20, to / 20, 1, 1})
    end
    self.index = index
    self.exits = drawableExits
    self.event = event
end

return RoomModel
