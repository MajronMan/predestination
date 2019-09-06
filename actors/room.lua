local Room = {}
Room.__index = Room

function Room.new(self, index, exits)
    local h = love.graphics.getHeight()
    local drawableExits = {}
    for i = 1, #exits do
        drawableExits[i] = {
            to = exits[i],
            x = 200 * i,
            y = 0,
            width = 100,
            height = 100
        }
    end
    local self =
        setmetatable(
        {
            width = love.graphics.getWidth(),
            height = h,
            x = 0,
            y = h,
            index = index,
            exits = drawableExits
        },
        Room
    )
    return self
end

return Room
