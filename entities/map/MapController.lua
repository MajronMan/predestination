local class = require("middleclass")

local MapModel = require("entities.map.MapModel")
local RoomController = require("entities.room.RoomController")

local MapController = class("entities.MapController")

function MapController.static:load(ctx, data)
    local layout = {}
    for i, room in ipairs(data.layout) do
        table.insert(layout, i, RoomController:load(ctx, room, i))
    end
    return MapController(MapModel(layout, data.currentRoomId))
end

function MapController:initialize(model)
    self._model = model
end

function MapController:getCurrentRoom()
    return self._model.layout[self._model.currentRoomId]
end

function MapController:enterRoom(roomId)
    self._model.currentRoomId = roomId
end

return MapController
