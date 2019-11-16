require("custom_conf")

local nuklear = require("nuklear")

local ContextController = require("entities.ContextController")
local GameState = require("state.GameState")
local map = require("assets.map")
local data = require("assets.initialData")
local binser = require("binser")

function love.load()
    font = love.graphics.newFont(data.fontSize)
    love.graphics.setFont(font)
    ctx = ContextController:load(data)
    state = GameState(data, ctx.player.model, ctx.spellbook.model)
    love.keyboard.setKeyRepeat(true)
    ui = nuklear.newUI()
end

function love.update(dt)
    ctx:update(state, dt)
end

function love.draw()
    state:getRoom():draw()
    ctx:draw()
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

function love.mousemoved(x, y, dx, dy, istouch)
    ui:mousemoved(x, y, dx, dy, istouch)
end

function love.mousepressed(x, y, button, istouch, presses)
    ctx:mousepressed(x, y, button, istouch, presses)
    ui:mousepressed(x, y, button, istouch, presses)
end

function love.mousereleased(x, y, button, istouch, presses)
    ui:mousereleased(x, y, button, istouch, presses)
end

function love.textinput(text)
    ui:textinput(text)
end

function love.wheelmoved(x, y)
    ui:wheelmoved(x, y)
end
