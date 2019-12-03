local class = require("middleclass")

local RoomModel = require("entities.room.RoomModel")

local RoomController = class("entities.room.RoomController")

function RoomController.static:load(ctx, data, i)
    local event = nil
    if data.event then
        event = require(data.event.class):load(ctx, data.event.data)
    end
    return RoomController(RoomModel(i, data.exits, event))
end

function RoomController:initialize(model)
    self.model = model
end

function RoomController:getId()
    return self.model.id
end

function RoomController:getExits()
    return self.model.exits
end

function RoomController:getEvent()
    return self.model.event
end

return RoomController
