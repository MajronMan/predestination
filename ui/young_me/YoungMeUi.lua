local class = require("middleclass")

local DialogueLayout = require("ui.young_me.DialogueLayout")
local RoomLayout = require("ui.young_me.RoomLayout")
local SideMenuLayout = require("ui.young_me.SideMenuLayout")
local SpellbookLayout = require("ui.young_me.SpellbookLayout")
local StatsLayout = require("ui.young_me.StatsLayout")

local YoungMeUi = class("ui.young_me.YoungMeUi")

function YoungMeUi:initialize(ctx, data)
    self.ctx = ctx
    self.data = data

    self.font = love.graphics.newFont(self.data.fontSize)
    self.layouts = {
        DialogueLayout(),
        RoomLayout(ctx.map),
        SideMenuLayout(),
        SpellbookLayout(ctx.spellbook),
        StatsLayout(ctx.player)
    }
end

function YoungMeUi:frame(ui)
    ui:styleSetFont(self.font)

    for _, layout in pairs(self.layouts) do
        layout:frame(ui)
    end
end

return YoungMeUi
