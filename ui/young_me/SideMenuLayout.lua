local class = require("middleclass")

local SideMenuLayout = class("ui.young_me.SideMenuLayout")

function SideMenuLayout:frame(ui)
    if ui:windowBegin("SideMenu", 1700, 0, 220, 1080) then
        ui:layoutRow("dynamic", 175, 1)
        ui:button("Minimap")
        ui:button("Inventory")
        ui:button("Spells")
        ui:button("Collectables")
        ui:button("Battle Stats")
        ui:button("Options")
    end
    ui:windowEnd()
end

return SideMenuLayout
