local BaseController = {}

function BaseController:new(model, view)
    local o = o or {}
    self.__index = self
    setmetatable(o, self)

    o.model = model
    o.view = view

    return o
end

function BaseController:load()
    error("load not implemented")
end

function BaseController:update(dt)
    error("update not implemented")
end

function BaseController:draw()
    error("draw not implemented")
end

return BaseController
