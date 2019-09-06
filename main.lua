Room = require("actors.room")
Player = require("actors.player")
map = require("state.map")

function love.load()
    player = Player:new()
    room = map[1]
    font = love.graphics.newFont(25)
    love.graphics.setFont(font)
end

function checkCollision(a, b)
    local dx = math.abs(a.x - b.x)
    local dy = math.abs(a.y - b.y)
    local mx = (a.width + b.width) / 2
    local my = (a.height + b.height) / 2

    return dx < mx and dy < my
end

function love.update(dt)
    if love.keyboard.isDown("d") and player.x < love.graphics.getWidth() - player.width then
        player.x = player.x + (player.speed * dt)
    end
    if love.keyboard.isDown("a") and player.x > 0 then
        player.x = player.x - (player.speed * dt)
    end
    if love.keyboard.isDown("w") and player.y > 0 then
        player.y = player.y - (player.speed * dt)
    end
    if love.keyboard.isDown("s") and player.y < love.graphics.getHeight() - player.height then
        player.y = player.y + (player.speed * dt)
    end

    for i, exit in ipairs(room.exits) do
        if checkCollision(player, exit) then
            room = map[exit.to]
            player.x = (love.graphics.getWidth() - player.width) / 2
            player.y = (love.graphics.getHeight() - player.height) / 2
        end
    end
end

function love.draw()
    love.graphics.setColor(0, 0, 0)
    love.graphics.rectangle("fill", room.x, room.y, room.height, room.width)

    for i, exit in ipairs(room.exits) do
        love.graphics.setColor(1 - room.index / 20, room.index / 20, 1)
        love.graphics.rectangle("fill", exit.x, exit.y, exit.width, exit.height)

        love.graphics.setColor(0, 0, 0)
        love.graphics.print(exit.to, exit.x + exit.width / 4, exit.y + exit.width / 4)
    end
    love.graphics.setColor(1, 1, 1)
    love.graphics.draw(player.image, player.x, player.y, 0, player.xScale, player.yScale, 0, 32)
end
