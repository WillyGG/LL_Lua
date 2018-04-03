require "Cards.Card"

local name = "Priest"
local desc = "Choose another player, they must reveal their hand to you."
local quant = 2
local value = 2

Priest = Card:new()
function Priest:new()
    local inst = Card:new(name, desc, quant, value)
    return inst
end