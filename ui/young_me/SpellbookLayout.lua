local class = require("middleclass")

local SpellbookLayout = class("ui.young_me.SpellbookLayout")

function SpellbookLayout:initialize(model)
    self.model = model
end

function SpellbookLayout:frame(ui)
    if ui:windowBegin("Spellbook", 0, 110, 220, 970, "title") then
        ui:layoutRow("dynamic", 149, 1)
        for _, spell in pairs(self.model.spells) do
            if ui:button(spell.model.name) then
                spell:cast(ctx.player.model)
            end
        end
    end
    ui:windowEnd()
end

return SpellbookLayout
