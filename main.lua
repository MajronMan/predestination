require("custom_conf")

local nuklear = require("nuklear")
local YoungMeUi = require("ui.young_me.YoungMeUi")

local ContextController = require("entities.ContextController")
local data = require("assets.initial_data")

local ctx
local ui
local ymUi

function love.load()
    ctx = ContextController:load(data)
    ui = nuklear.newUI()
    ymUi = YoungMeUi(ctx, data)
end

function love.update(dt)
    ui:frameBegin()
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
