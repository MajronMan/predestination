local PlayerModel = {}
PlayerModel.__index = PlayerModel

function PlayerModel:new(x, y, width, height, speed, hp, mp, ip, maxHp, maxMp, maxIp)
    return setmetatable(
        {
            x = x,
            y = y,
            width = width,
            height = height,
            speed = speed,
            hp = hp,
            mp = mp,
            ip = ip,
            maxHp = maxHp,
            maxMp = maxMp,
            maxIp = maxIp
        },
        self
    )
end

return PlayerModel
