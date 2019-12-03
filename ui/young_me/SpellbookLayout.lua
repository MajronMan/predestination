local class = require("middleclass")

local SpellbookLayout = class("ui.young_me.SpellbookLayout")

function SpellbookLayout:initialize(model)
    self.model = model
end

function SpellbookLayout:frame(ui)
    if ui:windowBegin("Spellbook", 0, 110, 220, 970, "title") then
        ui:layoutRow("dynamic", 149, 1)
        self.model:update(ui, nil, nil)
    end
    ui:windowEnd()
end

return SpellbookLayout
