local class = require("middleclass")

local SpellView = class("entities.spell.SpellView")

function SpellView:initialize(i, image)
    self.i = i
    self.image = image
end

function SpellView:update(ui, state, dt)
    return ui:button("entities.spell.SpellView[" .. self.i .. "]", self.image)
end

return SpellView
