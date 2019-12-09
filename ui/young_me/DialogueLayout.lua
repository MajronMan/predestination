local class = require("middleclass")

local Layout = require("ui.Layout")

local DialogueLayout = class("ui.young_me.DialogueLayout", Layout)

function DialogueLayout:initialize(window, rBounds)
    Layout.initialize(self, window, rBounds)
end

function DialogueLayout:body(ui)
    if ui:groupBegin("Dialogue", "title") then
        ui:groupEnd()
    end
end

return DialogueLayout
