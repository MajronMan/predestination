local class = require("middleclass")

local DialogueLayout = class("ui.young_me.DialogueLayout")

function DialogueLayout:frame(ui)
    ui:layoutSpacePush(0.15, 0.7, 0.7, 0.3)
    if ui:groupBegin("Dialogue", "title") then
        ui:groupEnd()
    end
end

return DialogueLayout
