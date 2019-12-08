local class = require("middleclass")

local Layout = require("ui.Layout")

local RoomLayout = class("ui.young_me.RoomLayout", Layout)

function RoomLayout:initialize(bounds, model)
    Layout.initialize(self, bounds)
    self._model = model
end

function RoomLayout:body(ui)
    local room = self._model:getCurrentRoom()
    local title = "Room: " .. room:getId()
    if ui:groupBegin(title, "title") then
        self:exits(ui, room:getExits())
        local event = room:getEvent()
        if event and not event:isTriggered() then
            self:event(ui, event)
        end
        ui:groupEnd()
    end
end

function RoomLayout:exits(ui, exits)
    ui:layoutRow("dynamic", 700, 2)
    for _, exit in ipairs(exits) do
        if ui:button(exit) then
            self._model:enterRoom(exit)
        end
    end
end

function RoomLayout:event(ui, event)
    if ui:popupBegin("static", event:getTitle(), 500, 200, 400, 300, "title") then
        ui:layoutRow("dynamic", 130, 1)
        ui:label(event:getText(), "wrap")
        ui:layoutRow("dynamic", 100, 1)
        if ui:button("OK") then
            event:trigger()
            ui:popupClose()
        end
        ui:popupEnd()
    end
end

return RoomLayout
