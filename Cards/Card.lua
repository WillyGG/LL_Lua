Card = {name="", desc="", quant=0, value=0}
Card.__index = Card

CARD_HEIGHT = 200
CARD_WIDTH = 100

function Card:new(name, desc, quant, value)
    local self = setmetatable({}, Card)
    self.name = name
    self.desc = desc
    self.quant = quant
    self.value = value

    self.x = nil
    self.y = nil
    
    return self
end

function Card:toString() 
    return self.name
end

function Card:draw(x_arg, y_arg)
    self.x = x_arg or 100
    self.y = y_arg or 100

    love.graphics.print(self.name, self.x, self.y)
end

function Card:isClicked()
    local m_x, m_y = love.mouse.getPosition()
    if (self.x <= m_x and m_x <= self.x+CARD_WIDTH and 
        self.y <= m_y and m_y <= self.y+CARD_HEIGHT) then
        return true
    end
    return false
end