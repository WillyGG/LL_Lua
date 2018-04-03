require "Cards.Card"

local name = "Princess"
local desc = "If you discard this card, you are out."
local quant = 1
local value = 8

Princess = Card:new()

function Princess:new()
    local inst = Card:new(name, desc, quant, value)
    return inst
end