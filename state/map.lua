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

--- CR: I'd make this list a dictionary to make room indices explicit.
--- Modifying the map shape would be a major PITA without them.
--- This already manifests in 3 comments regarding just the indices :d
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
