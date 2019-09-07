local Room = require("actors.room")
local Player = require("actors.player.Player")
--- CR: I'd make 'map' a member of Map module,
--- because require returning a variable is meh
local map = require("state.map")

function love.load()
    local data = dofile("assets/data.lua")

    player = Player:load(data)
    room = map[1]
    font = love.graphics.newFont(25)
    love.graphics.setFont(font)

    data = nil
end

--- CR: Good as v1, but why not just check the exact bounds,
--- which would work more predictably?
--- Also, since this retuns boolean I'd name it as a question: 'isColliding'
function checkCollision(a, b)
    local dx = math.abs(a.x - b.x)
    local dy = math.abs(a.y - b.y)
    local mx = (a.width + b.width) / 2
    local my = (a.height + b.height) / 2

    return dx < mx and dy < my
end

function love.update(dt)
    player:update(dt)

    for i, exit in ipairs(room.exits) do
        if checkCollision(player.model, exit) then
            room = map[exit.to]
            player.model.x = (love.graphics.getWidth() - player.model.width) / 2
            player.model.y = (love.graphics.getHeight() - player.model.height) / 2
        end
    end
end

--- CR: I'd extract 'drawPlayer' and 'drawDoors'
--- Also, the colors in here are magic numbers.
function love.draw()
    player:draw()

    love.graphics.setColor(0, 0, 0)
    love.graphics.rectangle("fill", room.x, room.y, room.height, room.width)

    for i, exit in ipairs(room.exits) do
        love.graphics.setColor(1 - room.index / 20, room.index / 20, 1)
        love.graphics.rectangle("fill", exit.x, exit.y, exit.width, exit.height)

        love.graphics.setColor(0, 0, 0)
        love.graphics.print(exit.to, exit.x + exit.width / 4, exit.y + exit.width / 4)
    end
    love.graphics.setColor(1, 1, 1)
end

function love.keypressed(key, scancode, isrepeat)
    if key == "escape" then
        love.event.quit()
    end
end
