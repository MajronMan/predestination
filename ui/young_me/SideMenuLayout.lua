local class = require("middleclass")

local Layout = require("ui.Layout")

local SideMenuLayout = class("ui.young_me.SideMenuLayout", Layout)

function SideMenuLayout:initialize(window, rBounds)
    Layout.initialize(self, window, rBounds)
end

function SideMenuLayout:body(ui)
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
