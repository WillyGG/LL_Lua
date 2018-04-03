require "Stack"
require "Cards.Guard"
require "Cards.Baron"
require "Cards.Countess"
require "Cards.Handmaid"
require "Cards.King"
require "Cards.Prince"
require "Cards.Princess"

local MAX_SIZE = 16
local Deck = Stack:new()

function Deck:new()
    return Stack:new(MAX_SIZE)
end


function Deck:init()
    self:push(5)
    print(self:pop())

    cards = {
        guard = Guard,
        baron = Baron,
        countess = Countess,
        handmaid = Handmaid,
        king = King,
        prince = Prince,
        princess = Princess
    }

    -- populate all the cards in 
    local cards_ordered = {}
    local avail_i = {}
    for k,v in pairs(cards) do
        local inst = v:new() -- new instance to get the quantity
        for j=1, inst.quant do
            cards_ordered[j] = v -- create new instance in cards_ordered
            avail_i[j] = j
        end
    end

    print(cards["guard"]:new().quant)
    -- randomly shuffle the deck
    
    local max_ind = #avail_i
    while (max_ind >= 1) do
        local rand_ind = math.random(max_ind)
        self:push(cards_ordered[rand_ind]:new()) -- push a new instance of a randomly selected card to deck
        -- push all the other values down and make the last value nil
        for i=rand_ind, max_ind-1 do
            avail[i] = avail[i+1]
        end
        avail_i[max_ind] = nil
        max_ind = max_ind - 1 
    end
end

deck = Deck:new()

--d:push(5)
--print(d:pop())

deck:init()
return deck