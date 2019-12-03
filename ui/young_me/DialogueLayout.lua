local class = require("middleclass")

local DialogueLayout = class("ui.young_me.DialogueLayout")

function DialogueLayout:frame(ui)
    if ui:windowBegin("Dialogue", 220, 800, 1480, 280, "title") then
    end
    ui:windowEnd()
end

return DialogueLayout
