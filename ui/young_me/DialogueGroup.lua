local class = require("middleclass")

local Group = require("ui.Group")

local DialogueGroup = class("ui.young_me.DialogueGroup", Group)

function DialogueGroup:initialize(window, title, rBounds)
    Group.initialize(self, window, title, rBounds, {"title"})
end

function DialogueGroup:body(ui)
end

return DialogueGroup
