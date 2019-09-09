local PlayerModel = {}
PlayerModel.__index = PlayerModel

function PlayerModel.new(speed, hp, mp, ip, maxHp, maxMp, maxIp)
    return setmetatable(
        {
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
