local class = require("middleclass")

local RoomLayout = class("ui.young_me.RoomLayout")

function RoomLayout:initialize(model)
    self._model = model
end

function RoomLayout:frame(ui)
    local room = self._model:getCurrentRoom()
    local windowTitle = "Room: " .. room:getId()
    if ui:windowBegin(windowTitle, 220, 0, 1480, 800, "title") then
        self:frameExits(ui, room:getExits())
        local event = room:getEvent()
        if event and not event:isTriggered() then
            self:frameEvent(ui, event)
        end
    end
    ui:windowEnd()
end

function RoomLayout:frameExits(ui, exits)
    ui:layoutRow("dynamic", 735, 2)
    for _, exit in ipairs(exits) do
        if ui:button(exit) then
            self._model:enterRoom(exit)
        end
    end
end

function RoomLayout:frameEvent(ui, event)
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
