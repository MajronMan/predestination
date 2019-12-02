local class = require("middleclass")

local RoomLayout = require("ui.young_me.RoomLayout")
local SideMenuLayout = require("ui.young_me.SideMenuLayout")
local SpellbookLayout = require("ui.young_me.SpellbookLayout")
local StatsLayout = require("ui.young_me.StatsLayout")

local YoungMeUi = class("ui.young_me.YoungMeUi")

function YoungMeUi:initialize(data, ctx)
    self.data = data
    self.ctx = ctx

    self.font = love.graphics.newFont(self.data.fontSize)
    self.layouts = {
        RoomLayout(ctx.map),
        SideMenuLayout(),
        SpellbookLayout(ctx.spellbook),
        StatsLayout(ctx.player.model)
    }
end

function YoungMeUi:frame(ui)
    ui:styleSetFont(self.font)

    for _, w in pairs(self.layouts) do
        w:frame(ui)
    end
end

return YoungMeUi
