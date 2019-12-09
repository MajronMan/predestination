local class = require("middleclass")

local Group = class("ui.Group")

function Group:initialize(window, title, rBounds, flags)
    self._window = window
    self._title = title
    self._rBounds = rBounds
    self._flags = flags or {}
end

function Group:frame(ui)
    ui:layoutSpacePush(unpack(self._rBounds))
    if ui:groupBegin(self._title, unpack(self._flags)) then
        self:body(ui)
        ui:groupEnd()
    end
end

function Group:body(ui)
    error(self.class.name .. ": Group body undefined")
end

return Group
