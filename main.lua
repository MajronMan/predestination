require("custom_conf")

local nuklear = require("nuklear")
local YoungMeWindow = require("ui.young_me.YoungMeWindow")

local ContextController = require("entities.ContextController")
local data = require("assets.initial_data")

local ctx
local font
local ui
local ymUi

function love.load()
    ctx = ContextController:load(data)
    font = love.graphics.newFont(data.fontSize)
    ui = nuklear.newUI()
    local w, h = love.graphics.getDimensions()
    ymUi = YoungMeWindow(0, 0, w, h, ctx)
end

function love.update(dt)
    ui:frameBegin()
    ui:styleSetFont(font)
    ymUi:frame(ui)
    ui:frameEnd()
end

function love.draw()
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
