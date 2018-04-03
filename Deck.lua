require "Stack"
require "Cards.Guard"
require "Cards.Baron"
require "Cards.Countess"
require "Cards.Handmaid"
require "Cards.King"
require "Cards.Prince"
require "Cards.Princess"

local deck = Stack:new(16)

function deck:init()
    cards = {
        guard = Guard:new(),
        baron = Baron:new(),
        countess = Countess:new(),
        handmaid = Handmaid:new(),
        king = King:new(),
        prince = Prince:new(),
        princess = Princess:new()
    }
    for key, value in pairs(cards) do
        for i=0, value.quant do 
            deck:push(value.name)
        end
    end
    -- randomly shuffle the deck

end

deck:init()

--[[
for key, value in pairs(deck) do
    print(value)
end
]]

return deck