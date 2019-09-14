local Player = require("actors.player.Player")
local Gui = require("gui.Gui")
local GameState = require("state.GameState")
local map = require("assets.map")

local nuklear = require("nuklear")

function love.load()
    -- CR. why dofile instead of require when it's .lua anyway?
    -- BTW we should serialize state to some other place
    -- assets is for static things
    local data = dofile("assets/initialData.lua")
    font = love.graphics.newFont(data.fontSize)
    love.graphics.setFont(font)
    state = GameState:new(data)
    love.keyboard.setKeyRepeat(true)
    ui = nuklear.newUI()
end

function love.update(dt)
    state.player:update(dt)

    local exitNo = state:getRoom():getCollidingExitNo(state.player:getBoundingBox())
    if exitNo ~= nil then
        state.currentRoomIndex = exitNo
        state.player:nextRoom()
        state:getRoom():enter(state.player.model)
    end
end

function love.draw()
    state:getRoom():draw()
    state.player:draw()

    Gui.draw(state.player:getStats())
    ui:draw()
end

function love.keypressed(key, scancode, isrepeat)
    if key == "escape" then
        love.event.quit()
    end
    ui:keypressed(key, scancode, isrepeat)
end

function love.keyreleased(key, scancode)
    ui:keyreleased(key, scancode)
end

function love.mousepressed(x, y, button, istouch, presses)
    ui:mousepressed(x, y, button, istouch, presses)
end

function love.mousereleased(x, y, button, istouch, presses)
    ui:mousereleased(x, y, button, istouch, presses)
end

function love.mousemoved(x, y, dx, dy, istouch)
    ui:mousemoved(x, y, dx, dy, istouch)
end

function love.textinput(text)
    ui:textinput(text)
end

function love.wheelmoved(x, y)
    ui:wheelmoved(x, y)
end
