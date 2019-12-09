local class = require("middleclass")

local Layout = class("ui.Layout")

function Layout:initialize(window, rBounds)
    self._window = window
    self._rBounds = rBounds
end

function Layout:frame(ui)
    self:head(ui)
    self:body(ui)
end

function Layout:head(ui)
    ui:layoutSpacePush(unpack(self._rBounds))
end

function Layout:body(ui)
    error(self.class.name .. ": Layout body undefined")
end

return Layout
