local class = require("middleclass")

local DialogueGroup = require("ui.young_me.DialogueGroup")
local RoomGroup = require("ui.young_me.RoomGroup")
local SideMenuGroup = require("ui.young_me.SideMenuGroup")
local SpellbookGroup = require("ui.young_me.SpellbookGroup")
local StatsGroup = require("ui.young_me.StatsGroup")
local Window = require("ui.Window")

local YoungMeWindow = class("ui.young_me.YoungMeWindow", Window)

function YoungMeWindow:initialize(x, y, w, h, ctx)
    Window.initialize(
        self,
        "YoungMeWindow",
        x,
        y,
        w,
        h,
        {},
        {
            DialogueGroup(self, "Dialogue", {0.15, 0.7, 0.7, 0.3}),
            RoomGroup(self, "Room", {0.15, 0, 0.7, 0.7}, ctx.map),
            SideMenuGroup(self, "SideMenu", {0.85, 0, 0.15, 1}),
            SpellbookGroup(self, "Spellbook", {0, 0.1, 0.15, 0.9}, ctx.spellbook, ctx.player),
            StatsGroup(self, "Stats", {0, 0, 0.15, 0.1}, ctx.player)
        }
    )
end

return YoungMeWindow
