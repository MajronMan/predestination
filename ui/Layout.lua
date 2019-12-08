local class = require("middleclass")

local Layout = class("ui.Layout")

function Layout:initialize(bounds)
    self._bounds = bounds
end

function Layout:frame(ui)
    self:head(ui)
    self:body(ui)
end

function Layout:head(ui)
    ui:layoutSpacePush(unpack(self._bounds))
end

function Layout:body(ui)
    error(self.class.name .. ": Layout body undefined")
end

return Layout
