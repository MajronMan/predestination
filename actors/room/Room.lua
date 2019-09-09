local RoomModel = require("actors.room.RoomModel")
local RoomView = require("actors.room.RoomView")
local isColliding = require("utils.collisions").isColliding

local Room = {}
Room.__index = Room

function Room.new(model, view)
    return setmetatable({model = model, view = view}, Room)
end

function Room.load(index, exits)
    return Room.new(RoomModel.new(index, exits), RoomView.new())
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

return Room
