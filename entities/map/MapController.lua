local class = require("middleclass")

local MapModel = require("entities.map.MapModel")

local MapController = class("entities.MapController")

function MapController:initialize(model)
    self.model = model
end

function MapController:load(ctx, data)
    local model = MapModel(data.layout, data.currentRoom)
    return MapController(model)
end

return MapController
