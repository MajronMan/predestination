local class = require("middleclass")

local Group = require("ui.Group")

local DialogueGroup = class("ui.young_me.DialogueGroup", Group)

function DialogueGroup:initialize(window, rBounds)
    Group.initialize(self, window, "Dialogue", rBounds, {"title"})
end

function DialogueGroup:body(ui)
end

return DialogueGroup
