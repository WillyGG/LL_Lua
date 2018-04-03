require "Stack"
require "Cards.Guard"
require "Cards.Baron"
require "Cards.Countess"
require "Cards.Handmaid"
require "Cards.King"
require "Cards.Prince"
require "Cards.Priest"
require "Cards.Princess"

local MAX_SIZE = 16
local Deck = Stack:new()

function Deck:new()
    local inst = Stack:new(MAX_SIZE)
    setmetatable(inst, self)
    self.__index = self
    self:init()
    return inst
end

function Deck:init()
    cards = {
        guard = Guard,
        baron = Baron,
        countess = Countess,
        handmaid = Handmaid,
        king = King,
        prince = Prince,
        priest = Priest,
        princess = Princess
    }

    -- populate all the cards in 
    local cards_ordered = {}
    local avail_i = {}
    local curr_ind = 1
    for k,v in pairs(cards) do
        local inst = v:new() -- new instance to get the quantity
        for j=1, inst.quant do
            cards_ordered[curr_ind] = v -- create new instance in cards_ordered
            avail_i[curr_ind] = curr_ind
            curr_ind = curr_ind + 1
        end
    end

    -- randomly shuffle the deck    
    local max_ind = #avail_i
    math.randomseed(os.time())
    while (max_ind >= 1) do
        local rand_ind = math.random(max_ind)
        self:push(cards_ordered[rand_ind]:new()) -- push a new instance of a randomly selected card to deck
        -- push all the other values down and make the last value nil
        for i=rand_ind, (max_ind-1) do
            avail_i[i] = avail_i[i+1]
        end
        avail_i[max_ind] = nil
        max_ind = max_ind - 1 
    end
end

local deck = Deck:new()
return deck