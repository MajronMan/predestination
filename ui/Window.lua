local class = require("middleclass")

local Window = class("ui.Window")

function Window:initialize(title, x, y, w, h, flags, layouts)
    self._title = title
    self._x, self._y, self._w, self._h = x, y, w, h
    self._flags = flags
    self._layouts = layouts
end

function Window:frame(ui)
    if ui:windowBegin(self._title, self._x, self._y, self._w, self._h, unpack(self._flags)) then
        self._x, self._y, self._w, self._h = ui:windowGetBounds()
        ui:layoutSpaceBegin("dynamic", self._h, #self._layouts)
        for _, layout in ipairs(self._layouts) do
            layout:frame(ui)
        end
    end
    ui:windowEnd()
end

function Window:w(ratio)
    return self._w * (ratio or 1)
end

function Window:h(ratio)
    return self._h * (ratio or 1)
end

return Window
