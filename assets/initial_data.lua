local data = {}

data.fontSize = 25

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
        [1] = {exits = {2, 3}},
        [2] = {
            exits = {4},
            event = {
                class = "events.HpEvent",
                data = {
                    hpDelta = -5,
                    title = "BOOOOOM!",
                    text = "YOU FOOL, IT WAS A TRAP!"
                }
            }
        },
        [3] = {exits = {4, 5}},
        [4] = {
            exits = {5, 6},
            event = {
                class = "events.HpEvent",
                data = {
                    hpDelta = -5,
                    title = "BAAAM!",
                    text = "YOU FALL, IT WAS A TROPE!"
                }
            }
        },
        [5] = {exits = {7, 8}},
        [6] = {exits = {9, 10}},
        [7] = {exits = {8, 10, 11}},
        [8] = {
            exits = {11},
            event = {
                class = "events.HpEvent",
                data = {
                    hpDelta = 5,
                    title = "AW YEAAAH!",
                    text = "YOU FOUND A FALAFEL AND FEEL BETTER RIGHT AFTER EATING IT!"
                }
            }
        },
        [9] = {exits = {12}},
        [10] = {exits = {11, 12}},
        [11] = {exits = {13}},
        [12] = {exits = {14}},
        [13] = {exits = {14}},
        [14] = {exits = {1}}
    },
    currentRoomId = 1
}

data.player = {
    hp = 10,
    mp = 10,
    ip = 10,
    maxHp = 10,
    maxMp = 10,
    maxIp = 10
}

data.spellbook = {
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

return data
