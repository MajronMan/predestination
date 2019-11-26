local class = require("middleclass")

local RoomWidget = require("ui.young_me.RoomWidget")
local SideMenuWidget = require("ui.young_me.SideMenuWidget")
local SpellbookWidget = require("ui.young_me.SpellbookWidget")
local StatsWidget = require("ui.young_me.StatsWidget")

local YoungMeUi = class("ui.young_me.YoungMeUi")

function YoungMeUi:initialize(data, ctx)
    self.data = data
    self.ctx = ctx

    self.font = love.graphics.newFont(self.data.fontSize)
    self.widgets = {
        RoomWidget(),
        SideMenuWidget(),
        SpellbookWidget(ctx.spellbook),
        StatsWidget(ctx.player.model)
    }
end

function YoungMeUi:frame(ui)
    ui:styleSetFont(self.font)

    for _, w in pairs(self.widgets) do
        w:frame(ui)
    end
end

return YoungMeUi
