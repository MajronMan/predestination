local data = {}

local spellbook = {
    {
        name = "HP +10",
        effect = function(target)
            target.hp = target.hp + 10
        end
    },
    {
        name = "HP -10",
        effect = function(target)
            target.hp = target.hp - 10
        end
    },
    {
        name = "MP +10",
        effect = function(target)
            target.mp = target.mp + 10
        end
    },
    {
        name = "MP -10",
        effect = function(target)
            target.mp = target.mp - 10
        end
    },
    {
        name = "IP +10",
        effect = function(target)
            target.ip = target.ip + 10
        end
    },
    {
        name = "IP -10",
        effect = function(target)
            target.ip = target.ip - 10
        end
    }
}

data.player = {
    hp = 10,
    mp = 10,
    ip = 10
}

data.fontSize = 25

data.spellbook = spellbook

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
data.map = {
    layout = {
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
    },
    currentRoom = 1
}

return data
