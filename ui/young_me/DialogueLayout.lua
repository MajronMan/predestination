local class = require("middleclass")

local Layout = require("ui.Layout")

local DialogueLayout = class("ui.young_me.DialogueLayout", Layout)

function DialogueLayout:initialize(bounds)
    Layout.initialize(self, bounds)
end

function DialogueLayout:body(ui)
    if ui:groupBegin("Dialogue", "title") then
        ui:groupEnd()
    end
end

return DialogueLayout
