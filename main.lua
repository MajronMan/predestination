require("custom_conf")

local nuklear = require("nuklear")

local ContextController = require("entities.ContextController")
local data = require("assets.initialData")
-- local GameState = require("state.GameState")
-- local map = require("assets.map")
-- local binser = require("binser")

function love.load()
    font = love.graphics.newFont(data.fontSize)
    love.graphics.setFont(font)
    ctx = ContextController:load(data)
    -- state = GameState(data, ctx.player.model, ctx.spellbook.model)
    -- love.keyboard.setKeyRepeat(true)
    ui = nuklear.newUI()
end

-- {1, 0, 0},
-- string.format("HP. %d / %d\n", stats.hp, stats.maxHp),
-- {0, 0, 1},
-- string.format("MP. %d / %d\n", stats.mp, stats.maxMp),
-- {1, 0, 1},
-- string.format("IP. %d / %d\n", stats.ip, stats.maxIp)

function love.update(dt)
    ui:frameBegin()

    if ui:windowBegin("Stats", 0, 0, 220, 110) then
        ui:layoutRow("dynamic", 30, 2)
        ui:label("HP:", "left", "#ff4444")
        ui:label(ctx.player.model.hp .. " / " .. ctx.player.model.maxHp, "right", "#ff4444")
        ui:label("MP:", "left", "#4444ff")
        ui:label(ctx.player.model.mp .. " / " .. ctx.player.model.maxMp, "right", "#4444ff")
        ui:label("IP:", "left", "#ff44ff")
        ui:label(ctx.player.model.ip .. " / " .. ctx.player.model.maxIp, "right", "#ff44ff")
    end
    ui:windowEnd()

    if ui:windowBegin("Menu", 1700, 0, 220, 1080) then
        ui:layoutRow("dynamic", 175, 1)
        ui:button("Minimap")
        ui:button("Inventory")
        ui:button("Spells")
        ui:button("Collectables")
        ui:button("Battle Stats")
        ui:button("Options")
    end
    ui:windowEnd()

    if ui:windowBegin("Room", 200, 125, 1400, 700, "title") then
    end
    ui:windowEnd()

    if ui:windowBegin("Context Menu", 200, 840, 1400, 225, "title") then
        ui:layoutRow("dynamic", 172, 6)
        for _, spell in pairs(ctx.spellbook.spells) do
            if ui:button(spell.model.name) then
                spell:cast(ctx.player.model)
            end
        end
    end
    ui:windowEnd()

    ui:frameEnd()
    -- ctx:update(ui, state, dt)
end

function love.draw()
    -- state:getRoom():draw()
    -- ctx:draw()
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
