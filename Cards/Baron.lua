require "Cards.Card"

local name = "Baron"
local desc = "Choose another player, whoever has the lower value card is out."
local quant = 2
local value = 3

Baron = Card:new()

function Baron:new()
    local inst = Card:new(name, desc, quant, value)
    setmetatable(inst, self)
    self.__index = self
    return inst
end

function Baron:draw(x_arg, y_arg)
    local x = x_arg or 100
    local y = y_arg or 100
    -- draw the card border
    love.graphics.setColor(204, 0, 153)
    love.graphics.rectangle("fill", x, y, CARD_WIDTH, CARD_HEIGHT)
    -- draw the name 
    love.graphics.setColor(255,255,255)
    love.graphics.print(self.name, x+15, y+15)
end