local class = require("middleclass")

local RoomWidget = class("ui.young_me.RoomWidget")

function RoomWidget:frame(ui)
    if ui:windowBegin("Room", 200, 125, 1400, 700, "title") then
    end
    ui:windowEnd()
end

return RoomWidget
