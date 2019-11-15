local RoomController = require("entities.room.RoomController")

--               1
--              / \
--             2   3
--              \ / \
--               4 - 5
--              /   / \
--             6   7 - 8
--            / \ / \ /
--           9   A - B
--            \ /   /
--             C   D
--              \ /
--               E

local exitsList = {
    [1] = {2, 3},
    [2] = {4},
    [3] = {4, 5},
    [4] = {5, 6},
    [5] = {7, 8},
    [6] = {9, 10},
    [7] = {8, 10, 11},
    [8] = {11},
    [9] = {12},
    [10] = {11, 12},
    [11] = {13},
    [12] = {14},
    [13] = {14},
    [14] = {1}
}
local map = {}

for i, exits in ipairs(exitsList) do
    map[i] = RoomController:load(i, exits)
end

--- CR. I'd make 'map' a member of Map module,
--- because require returning a variable is meh
--- ~Łukasz
--- imo good
--- ~Miron
return map
