local FontRenderer = {}

FontRenderer.__index = FontRenderer

function FontRenderer.new(text, x, y, color, font)
    if color == nil then
        color = {0, 0, 0, 1}
    end
    return setmetatable(
        {
            x = x,
            y = y,
            text = text,
            color = color,
            font = font
        },
        FontRenderer
    )
end

function FontRenderer:draw()
    love.graphics.setColor(self.color)
    local oldFont = love.graphics.getFont()
    if self.font then
        love.graphics.setFont(self.font)
    end
    love.graphics.print(self.text, self.x, self.y)
    if self.font then
        love.graphics.setFont(oldFont)
    end
end

return FontRenderer
