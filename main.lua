require("custom_conf")

local nuklear = require("nuklear")

local PlayerController = require("entities.player.PlayerController")
local SpellbookController = require("entities.spellbook.SpellbookController")
local GameState = require("state.GameState")
local map = require("assets.map")
local data = require("assets.initialData")
local binser = require("binser")

function love.load()
    font = love.graphics.newFont(data.fontSize)
    love.graphics.setFont(font)
    player = PlayerController:load(data.player)
    spellbook = SpellbookController:load(data.spells, player)
    state = GameState(data, player.model, spellbook.model)
    love.keyboard.setKeyRepeat(true)
    ui = nuklear.newUI()
end

function love.update(dt)
    player:update(state, dt)
end

function love.draw()
    state:getRoom():draw()
    player:draw()
    spellbook:draw()

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
    spellbook:mousepressed(x, y, button, istouch, presses)
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
