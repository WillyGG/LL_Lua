require "Cards.Card"

local name = "Countess"
local desc = "If you have a Prince or King in your hand you must discard this card."
local quant = 1
local value = 7

Countess = Card:new()

function Countess:new()
    local inst = Card:new(name, desc, quant, value)
    return inst
end