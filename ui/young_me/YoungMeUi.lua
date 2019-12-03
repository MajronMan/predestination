local class = require("middleclass")

local DialogueLayout = require("ui.young_me.DialogueLayout")
local RoomLayout = require("ui.young_me.RoomLayout")
local SideMenuLayout = require("ui.young_me.SideMenuLayout")
local SpellbookLayout = require("ui.young_me.SpellbookLayout")
local StatsLayout = require("ui.young_me.StatsLayout")

local YoungMeUi = class("ui.young_me.YoungMeUi")

function YoungMeUi:initialize(ctx, data)
    self._font = love.graphics.newFont(data.fontSize)
    self._layouts = {
        DialogueLayout(),
        RoomLayout(ctx.map),
        SideMenuLayout(),
        SpellbookLayout(ctx.spellbook),
        StatsLayout(ctx.player)
    }
end

function YoungMeUi:frame(ui)
    ui:styleSetFont(self._font)

    for _, layout in pairs(self._layouts) do
        layout:frame(ui)
    end
end

return YoungMeUi
