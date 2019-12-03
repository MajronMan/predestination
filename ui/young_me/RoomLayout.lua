local class = require("middleclass")

local RoomLayout = class("ui.young_me.RoomLayout")

function RoomLayout:initialize(model)
    self.model = model
end

function RoomLayout:frame(ui)
    local room = self.model:getCurrentRoom()
    if ui:windowBegin("Room: " .. room.model.id, 220, 0, 1480, 800, "title") then
        ui:layoutTemplateBegin(735)
        ui:layoutTemplatePush("dynamic")
        ui:layoutTemplatePush("dynamic")
        ui:layoutTemplateEnd()
        for _, exit in ipairs(room.model.exits) do
            if ui:button(exit) then
                self.model:enterRoom(exit)
            end
        end
        local event = room.model.event
        if event ~= nil and not event.triggered then
            if ui:popupBegin("static", event.title, 500, 200, 400, 300, "title") then
                ui:layoutRow("dynamic", 130, 1)
                ui:label(event.text, "wrap")
                ui:layoutRow("dynamic", 100, 1)
                if ui:button("OK") then
                    event:trigger()
                    ui:popupClose()
                end
                ui:popupEnd()
            end
        end
    end
    ui:windowEnd()
end

return RoomLayout
