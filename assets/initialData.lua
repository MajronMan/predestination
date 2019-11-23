local data = {}

local spellbook = {}

table.insert(
    spellbook,
    {
        width = 32,
        height = 32,
        image = "assets/images/player.png",
        xOffset = 0,
        yOffset = 16,
        x = 100,
        y = 100,
        name = "Heal",
        mp = 10,
        effect = function(target)
            target.hp = target.hp + 10
        end
    }
)

table.insert(
    spellbook,
    {
        x = 50,
        y = 50,
        width = 32,
        height = 32,
        image = "assets/images/player.png",
        xOffset = 0,
        yOffset = 16,
        name = "Restore Mana",
        mp = 0,
        effect = function(target)
            target.mp = target.mp + 10
        end
    }
)

data.player = {
    width = 64,
    height = 64,
    image = "assets/images/player.png",
    rotation = 0,
    xOffset = 0,
    yOffset = 32,
    speed = 400,
    hp = 10,
    mp = 10,
    ip = 10
}

data.fontSize = 25

data.currentRoomIndex = 1

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
