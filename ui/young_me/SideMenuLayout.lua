local class = require("middleclass")

local SideMenuLayout = class("ui.young_me.SideMenuLayout")

function SideMenuLayout:frame(ui)
    ui:layoutSpacePush(0.85, 0, 0.15, 1)
    if ui:groupBegin("SideMenu") then
        ui:layoutRow("dynamic", 175, 1)
        ui:button("Minimap")
        ui:button("Inventory")
        ui:button("Spells")
        ui:button("Collectables")
        ui:button("Battle Stats")
        ui:button("Options")
        ui:groupEnd()
    end
end

return SideMenuLayout
