local class = require("middleclass")

local SpellView = class("entities.spell.SpellView")

function SpellView:initialize(name)
    self.name = name
end

function SpellView:update(ui, state, dt)
    return ui:button(self.name)
end

return SpellView
