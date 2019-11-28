local class = require("middleclass")

local RoomModel = require("entities.room.RoomModel")
local RoomView = require("entities.room.RoomView")
local isColliding = require("utils.collisions").isColliding
local HpEvent = require("entities.event.HpEvent")

local RoomController = class("entities.room.RoomController")

function RoomController:initialize(model, view)
    self.model = model
    self.view = view
end

function RoomController:load(ctx, data, i)
    local event = nil
    if data.event ~= nil then
        event = require(data.event.class):load(ctx, data.event.data)
    end
    return RoomController(RoomModel(i, data.exits, event), RoomView())
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
