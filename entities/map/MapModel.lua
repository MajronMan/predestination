local class = require("middleclass")

local MapModel = class("entities.map.MapModel")

function MapModel:initialize(layout, currentRoomId)
    self.layout = layout
    self.currentRoomId = currentRoomId
end

return MapModel
