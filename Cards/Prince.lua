require "Cards.Card"

local name = "Prince"
local desc = "Choose any player, that player must discard their hand and draw a new card."
local quant = 2
local value = 5

Prince = Card:new()
function Prince:new()
    local inst = Card:new(name, desc, quant, value)
    setmetatable(inst, self)
    self.__index = self
    return inst
end