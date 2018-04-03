require "Cards.Card"

local name = "Baron"
local desc = "Choose another player, whoever has the lower value card is out."
local quant = 2
local value = 3

Baron = Card:new()

function Baron:new()
    local inst = Card:new(name, desc, quant, value)
    return inst
end