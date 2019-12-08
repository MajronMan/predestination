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
        DialogueLayout({0.15, 0.7, 0.7, 0.3}),
        RoomLayout({0.15, 0, 0.7, 0.7}, ctx.map),
        SideMenuLayout({0.85, 0, 0.15, 1}),
        SpellbookLayout({0, 0.1, 0.15, 0.9}, ctx.spellbook),
        StatsLayout({0, 0, 0.15, 0.1}, ctx.player)
    }
end

function YoungMeUi:frame(ui)
    ui:styleSetFont(self._font)
    local w, h = love.graphics.getDimensions()
    if ui:windowBegin("YoungMeUi", 0, 0, w, h) then
        ui:layoutSpaceBegin("dynamic", h, #self._layouts)
        for _, layout in pairs(self._layouts) do
            layout:frame(ui)
        end
    end
    ui:windowEnd()
end

return YoungMeUi
