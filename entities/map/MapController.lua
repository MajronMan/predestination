local class = require("middleclass")

local MapModel = require("entities.map.MapModel")
local RoomController = require("entities.room.RoomController")

local MapController = class("entities.MapController")

function MapController:initialize(model)
    self.model = model
end

function MapController:load(ctx, data)
    local layout = {}
    for i, room in ipairs(data.layout) do
        table.insert(layout, i, RoomController:load(ctx, room, i))
    end
    return MapController(MapModel(layout, data.currentRoom))
end

function MapController:getCurrentRoom()
    return self.model.layout[self.model.currentRoom]
end

function MapController:enterRoom(id)
    self.model.currentRoom = id
end

return MapController
