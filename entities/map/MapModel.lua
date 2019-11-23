local class = require("middleclass")

local MapModel = class("entities.map.MapModel")

function MapModel:initialize(layout, currentRoom)
    self.layout = layout
    self.currentRoom = currentRoom
end

return MapModel
