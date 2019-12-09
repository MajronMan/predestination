local class = require("middleclass")

local Group = require("ui.Group")

local RoomGroup = class("ui.young_me.RoomGroup", Group)

function RoomGroup:initialize(window, rBounds, map)
    Group.initialize(self, window, "Room", rBounds)
    self._map = map
end

function RoomGroup:body(ui)
    local room = self._map:getCurrentRoom()

    ui:layoutRow("dynamic", 50, 1)
    ui:label("Room " .. room:getId(), "centered")

    self:exits(ui, room:getExits())

    local event = room:getEvent()
    if event and not event:isTriggered() then
        self:event(ui, event)
    end
end

function RoomGroup:exits(ui, exits)
    ui:layoutRow("dynamic", 675, 2)
    for _, exit in ipairs(exits) do
        if ui:button(exit) then
            self._map:enterRoom(exit)
        end
    end
end

function RoomGroup:event(ui, event)
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

return RoomGroup
