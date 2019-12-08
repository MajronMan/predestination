local class = require("middleclass")

local DialogueLayout = class("ui.young_me.DialogueLayout")

function DialogueLayout:initialize(bounds)
    self._bounds = bounds
end

function DialogueLayout:frame(ui)
    ui:layoutSpacePush(unpack(self._bounds))
    if ui:groupBegin("Dialogue", "title") then
        ui:groupEnd()
    end
end

return DialogueLayout
