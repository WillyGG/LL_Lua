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
    
    return self
end

function Card:toString() 
    return self.name
end

function Card:draw(x_arg, y_arg)
    local x = x_arg or 100
    local y = y_arg or 100

    love.graphics.print(self.name, x, y)
end

--local Guard = Card:new("Guard", "asdflkajsd", 5, 1)
--local Princess = Card:new("Princess", "adlkfjasldk", 1, 8)
--print("Guard name, ", Guard.name)
--print("Princess name", Princess.name)