local data = {}

local spells = {}

table.insert(
    spells,
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
    spells,
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

data.spells = spells

return data
