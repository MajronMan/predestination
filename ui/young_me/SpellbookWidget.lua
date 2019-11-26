local class = require("middleclass")

local SpellbookWidget = class("ui.young_me.SpellbookWidget")

function SpellbookWidget:initialize(model)
    self.model = model
end

function SpellbookWidget:frame(ui)
    if ui:windowBegin("Spellbook", 200, 840, 1400, 225, "title") then
        ui:layoutRow("dynamic", 172, 6)
        self.model:update(ui, nil, nil)
    end
    ui:windowEnd()
end

return SpellbookWidget
