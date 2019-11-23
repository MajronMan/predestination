local class = require("middleclass")

local MapController = class("entities.MapController")

function MapController:initialize(layout, currentRoom)
    self.layout = layout
    self.currentRoom = currentRoom
end

function MapController:load(ctx, data)
    return MapController(data.layout, data.currentRoom)
end

return MapController
