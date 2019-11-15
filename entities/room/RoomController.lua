local class = require("middleclass")

local RoomModel = require("entities.room.RoomModel")
local RoomView = require("entities.room.RoomView")
local isColliding = require("utils.collisions").isColliding
local HpEvent = require("events.HpEvent")

local RoomController = class("entities.room.RoomController")

function RoomController:load(index, exits)
    local event = nil
    if math.random() < 0.2 then
        if math.random() > 0.5 then
            event = HpEvent(-2)
        else
            event = HpEvent(2)
        end
    end
    return RoomController(RoomModel(index, exits, event), RoomView())
end

function RoomController:initialize(model, view)
    self.model = model
    self.view = view
end

function RoomController:getCollidingExitNo(box)
    for i, exit in ipairs(self.model.exits) do
        if isColliding(box, exit:getBoundingBox()) then
            return exit.to
        end
    end
    return nil
end

function RoomController:draw()
    self.view:draw()
    for _, exit in pairs(self.model.exits) do
        exit:draw()
    end
end

function RoomController:enter(target)
    if self.model.event then
        self.model.event:trigger(target)
    end
end

return RoomController
