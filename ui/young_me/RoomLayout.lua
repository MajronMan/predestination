local class = require("middleclass")

local RoomLayout = class("ui.young_me.RoomLayout")

function RoomLayout:frame(ui)
    if ui:windowBegin("Room", 200, 125, 1400, 700, "title") then
    end
    ui:windowEnd()
end

return RoomLayout
