local class = require("middleclass")

local RoomModel = class("entities.room.RoomModel")

function RoomModel:initialize(id, exits, event)
    self.id = id
    self.exits = exits
    self.event = event
end

return RoomModel
