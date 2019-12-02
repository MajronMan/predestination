local class = require("middleclass")

local RoomModel = require("entities.room.RoomModel")

local RoomController = class("entities.room.RoomController")

function RoomController:initialize(model)
    self.model = model
    self.view = view
end

function RoomController:load(ctx, data, i)
    local event = nil
    if data.event ~= nil then
        event = require(data.event.class):load(ctx, data.event.data)
    end
    return RoomController(RoomModel(i, data.exits, event))
end

return RoomController
