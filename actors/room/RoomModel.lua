local Exit = require("actors.room.Exit")

local RoomModel = {}
RoomModel.__index = RoomModel

function RoomModel.new(index, exits)
    local drawableExits = {}
    for i, to in ipairs(exits) do
        drawableExits[i] = Exit.new(to, 200 * i, 0, 100, 100, {1 - to / 20, to / 20, 1, 1})
    end
    return setmetatable(
        {
            index = index,
            exits = drawableExits
        },
        RoomModel
    )
end

return RoomModel
