Hand = {}

function Hand:new()
    local self = setmetatable({}, Hand)
    
    -- populate the hand 
    for i=1, 2 do
        self[i] = nil
    end

    return self
end

