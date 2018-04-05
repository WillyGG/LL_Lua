Hand = {no_cards = 0, avail_ind = 1, MAX_CARDS = 2}

function Hand:new()
    local self = setmetatable({}, Hand)
    
    -- populate the hand 
    for i=1, 2 do
        self[i] = nil
    end

    return self
end

function Hand:add(card)
    if self.no_cards >= self.MAX_CARDS then
        return false
    end
    self[self.avail_ind] = card
    self.no_cards = self.no_cards + 1

    -- if no more spaces avail in hand
    if self.no_cards == self.MAX_CARDS then
        self.avail_ind = -1
    else
        -- circle the avail ind
        if avail_ind == 1 then avail_ind = 2
        elseif avail_ind == 2 then avail_ind = 1
    end
end

-- checks hand for card with card name, 
-- if card name is found, it is returned
-- if not then nil is returned   
function Hand:pop_card(card_name)
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
