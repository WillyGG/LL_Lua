require "Cards.Card"

local name = "King"
local desc = "Choose another player, trade hands with that player."
local quant = 1
local value = 6

King = Card:new()
function King:new()
    local inst = Card:new(name, desc, quant, value)
    setmetatable(inst, self)
    self.__index = self
    return inst
end