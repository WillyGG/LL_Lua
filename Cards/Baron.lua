require "Cards.Card"

local name = "Baron"
local desc = "Choose another player, whoever has the lower value card is out."
local quant = 2
local value = 3
local fill_colour = {204, 0, 153, 0.7}
local name_colour = {255,255,255}

Baron = Card:new()

function Baron:new()
    local inst = Card:new(name, desc, quant, value)
    inst:setColour(fill_colour, name_colour)
    setmetatable(inst, self)
    self.__index = self
    return inst
end
