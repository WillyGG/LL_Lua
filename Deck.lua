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
Deck = Stack:new()

function Deck:new()
    local inst = Stack:new(MAX_SIZE)
    setmetatable(inst, self)
    self.__index = self
    return inst
end

-- populates the deck with cards in a random order
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
    local curr_ind = 1
    for k,v in pairs(cards) do
        local inst = v:new() -- new instance to get the quantity
        for j=1, inst.quant do
            cards_ordered[curr_ind] = v -- create new copy
            curr_ind = curr_ind + 1
        end
    end
    local cards_shuff = shuffle_table(cards_ordered)
    for k,v in pairs(cards_shuff) do
        self:push(v:new())
    end
end

function Deck:pop_and_show()
    while not (self:isEmpty()) do
        print(self:pop().name)
    end
end

-- pass in a table of values, with integer indicies (1 based)
-- returns another table with elements in random positions
function shuffle_table(full_table) 
    local shuffled_t = {}

    local avail_i = {}
    local curr_ind = 1
    for k,v in pairs(full_table) do
        avail_i[curr_ind] = curr_ind
        curr_ind = curr_ind + 1
    end

     -- randomly shuffle the deck    
     local max_ind = #avail_i
     local curr_ind = 1
     math.randomseed(os.time())
     while (max_ind >= 1) do
         local rand_ind = math.random(max_ind)
         local ele = full_table[avail_i[rand_ind]] 
         shuffled_t[curr_ind] = ele
         curr_ind = curr_ind + 1
         -- push all the other avail indicies down and make the last value nil
         for i=rand_ind, (max_ind-1) do
             avail_i[i] = avail_i[i+1]
         end
         avail_i[max_ind] = nil
         max_ind = max_ind - 1 
     end

     return shuffled_t
end

local deck = Deck:new()
deck:init()

return deck