require "Cards.Card"

local name = "Handmaid"
local desc = "If you are targeted by a card, it has no effect."
local quant = 2
local value = 4

Handmaid = Card:new()
function Handmaid:new()
    local inst = Card:new(name, desc, quant, value)
    setmetatable(inst, self)
    self.__index = self
    return inst
end