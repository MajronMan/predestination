return {
    draw = function(stats)
        love.graphics.setColor(1, 1, 1)
        love.graphics.printf(
            {
                {1, 0, 0},
                string.format("HP. %d / %d\n", stats.hp, stats.maxHp),
                {0, 0, 1},
                string.format("MP. %d / %d\n", stats.mp, stats.maxMp),
                {1, 0, 1},
                string.format("IP. %d / %d\n", stats.ip, stats.maxIp)
            },
            0,
            0,
            love.graphics.getWidth()
        )
    end
}
