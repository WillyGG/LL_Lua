Hand = {no_cards = 0, avail_ind = 1, MAX_CARDS = 2}
Hand.__index = Hand

function Hand:new()
    local self = setmetatable({}, Hand)
    
    -- populate the hand 
    for i=1, 2 do
        self[i] = nil
    end

    return self
end

function Hand:add(card)
    if self:isFull() == true then
        return false
    end
    self[self.avail_ind] = card
    self.no_cards = self.no_cards + 1

    -- if no more spaces avail in hand
    if self.no_cards == self.MAX_CARDS then
        self.avail_ind = -1
    else
        -- circle the avail ind
        if self.avail_ind == 1 then 
            self.avail_ind = 2
        elseif self.avail_ind == 2 then 
            self.avail_ind = 1 
        end
    end
    return true
end

-- checks hand for card with card name, 
-- if card name is found, it is returned
-- if not then nil is returned   
function Hand:pop_card(card_name)
    if self:isEmpty() then
        return false
    end

    local toReturn = nil
    local i = 1
    local found = false

    while found == false and i <= MAX_CARDS do
        -- if found pop card from hand, decrement no cards and change avail_ind
        if self[i].name == card_name then
            toReturn = self[i]
            self[i] = nil
            no_cards = no_cards - 1
            avail_ind = i
        end
        i = i + 1
    end

    return toReturn
end

function Hand:isFull()
    if no_cards == self.MAX_CARDS then return true
    else return false end
end

function Hand:isEmpty()
    if no_cards == 0 then return true
    else return false end
end

function Hand:print_hand()
    for i=1, self.no_cards do
        local card = self[i]
        if card ~= nil then
            print(card.name)
        end
    end
end

function Hand:draw_hand()
    for i=1, self.no_cards do
        local card = self[i]
        if card ~= nil then
            local x = 100 * i
            card:draw(x)
        end
    end
end
