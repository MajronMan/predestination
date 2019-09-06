local Room = require("actors.room")

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

-- arrays start at 1 btw
local exitsList = {
    {2, 3},
    {4},
    {4, 5},
    {5, 6},
    {7, 8}, -- 5
    {9, 10},
    {8, 10, 11},
    {11},
    {12},
    {11, 12}, -- 10
    {13},
    {14},
    {14},
    {1}
}
local map = {}

for i, exits in ipairs(exitsList) do
    map[i] = Room:new(i, exits)
end

return map
