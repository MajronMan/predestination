local class = require("middleclass")

local DialogueLayout = require("ui.young_me.DialogueLayout")
local RoomLayout = require("ui.young_me.RoomLayout")
local SideMenuLayout = require("ui.young_me.SideMenuLayout")
local SpellbookLayout = require("ui.young_me.SpellbookLayout")
local StatsLayout = require("ui.young_me.StatsLayout")
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
            DialogueLayout(self, {0.15, 0.7, 0.7, 0.3}),
            RoomLayout(self, {0.15, 0, 0.7, 0.7}, ctx.map),
            SideMenuLayout(self, {0.85, 0, 0.15, 1}),
            SpellbookLayout(self, {0, 0.1, 0.15, 0.9}, ctx.spellbook, ctx.player),
            StatsLayout(self, {0, 0, 0.15, 0.1}, ctx.player)
        }
    )
end

return YoungMeWindow
