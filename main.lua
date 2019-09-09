local Player = require("actors.player.Player")
local Gui = require("gui.Gui")
local GameState = require("state.GameState")
local map = require("assets.map")

function love.load()
    -- CR. why dofile instead of require when it's .lua anyway?
    -- BTW we should serialize state to some other place
    -- assets is for static things
    local data = dofile("assets/initialData.lua")
    font = love.graphics.newFont(data.fontSize)
    love.graphics.setFont(font)
    state = GameState:new(data)
end

function love.update(dt)
    state.player:update(dt)

    local exitNo = state:getRoom():getCollidingExitNo(state.player:getBoundingBox())
    if exitNo ~= nil then
        state.player:nextRoom()
        state.currentRoomIndex = exitNo
    end
end

function love.draw()
    state:getRoom():draw()
    state.player:draw()

    Gui.draw(state.player:getStats())
end

function love.keypressed(key, scancode, isrepeat)
    if key == "escape" then
        love.event.quit()
    end
end
