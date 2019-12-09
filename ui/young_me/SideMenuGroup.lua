local class = require("middleclass")

local Group = require("ui.Group")

local SideMenuGroup = class("ui.young_me.SideMenuGroup", Group)

function SideMenuGroup:initialize(window, title, rBounds)
    Group.initialize(self, window, title, rBounds)
end

function SideMenuGroup:body(ui)
    ui:layoutRow("dynamic", 175, 1)
    ui:button("Minimap")
    ui:button("Inventory")
    ui:button("Spells")
    ui:button("Collectables")
    ui:button("Battle Stats")
    ui:button("Options")
end

return SideMenuGroup
