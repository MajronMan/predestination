local class = require("middleclass")

local SideMenuLayout = class("ui.young_me.SideMenuLayout")

function SideMenuLayout:initialize(bounds)
    self._bounds = bounds
end

function SideMenuLayout:frame(ui)
    ui:layoutSpacePush(unpack(self._bounds))
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
