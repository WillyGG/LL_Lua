Card = {name="", desc="", quant=0, value=0}

function Card:new(name, desc, quant, value)
    local self = setmetatable({}, Card)
    self.name = name
    self.desc = desc
    self.quant = quant
    self.value = value
    
    return self
end

--local Guard = Card:new("Guard", "asdflkajsd", 5, 1)
--local Princess = Card:new("Princess", "adlkfjasldk", 1, 8)
--print("Guard name, ", Guard.name)
--print("Princess name", Princess.name)