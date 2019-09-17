local Class = require("hump.class")

local RoomModel = require("actors.room.RoomModel")
local RoomView = require("actors.room.RoomView")
local isColliding = require("utils.collisions").isColliding
local HpEvent = require("events.HpEvent")

local Room =
    Class {
    load = function(Self, index, exits)
        local event = nil
        if math.random() < 0.2 then
            if math.random() > 0.5 then
                event = HpEvent(-2)
            else
                event = HpEvent(2)
            end
        end
        return Self(RoomModel(index, exits, event), RoomView())
    end,
    init = function(self, model, view)
        self.model = model
        self.view = view
    end,
    getCollidingExitNo = function(self, box)
        for i, exit in ipairs(self.model.exits) do
            if isColliding(box, exit:getBoundingBox()) then
                return exit.to
            end
        end
        return nil
    end,
    draw = function(self)
        self.view:draw()
        for _, exit in pairs(self.model.exits) do
            exit:draw()
        end
    end,
    enter = function(self, target)
        if self.model.event then
            self.model.event:trigger(target)
        end
    end
}

return Room
