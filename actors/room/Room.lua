local RoomModel = require("actors.room.RoomModel")
local RoomView = require("actors.room.RoomView")
local isColliding = require("utils.collisions").isColliding
local HpEvent = require("events.HpEvent")

local Room = {}
Room.__index = Room

function Room.new(model, view)
    return setmetatable({model = model, view = view}, Room)
end

function Room.load(index, exits)
    local event = nil
    if math.random() < 0.2 then
        if math.random() > 0.5 then
            event = HpEvent.new(-2)
        else
            event = HpEvent.new(2)
        end
    end
    return Room.new(RoomModel.new(index, exits, event), RoomView.new())
end

function Room:getCollidingExitNo(box)
    for i, exit in ipairs(self.model.exits) do
        if isColliding(box, exit:getBoundingBox()) then
            return exit.to
        end
    end
    return nil
end

function Room:draw()
    self.view:draw()
    for _, exit in pairs(self.model.exits) do
        exit:draw()
    end
end

function Room:enter(target)
    if self.model.event then
        self.model.event:trigger(target)
    end
end

return Room
