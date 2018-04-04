Stack = {rear = -1}
Stack.__index = Stack

-- constructor - initialise stack at passed size
function Stack:new(size)
    local self = setmetatable({}, Stack)

    self.size = size
    
    if size == nil then self.max_ind = 0
    else self.max_ind = size-1 end

    for i=0, self.max_ind do 
        self[i] = nil
    end
    return self
end

-- returns true if the stack is empty
function Stack:isEmpty()
    if self.rear == -1 then return true
    else return false
    end
end

-- returns true if the stack is full
function Stack:isFull()
    if self.rear == self.max_ind then return true
    else return false
    end
end

-- returns true if the push was successful
function Stack:push(item)
    if self:isFull() == true then 
        return nil
    else
        self.rear = self.rear + 1
        self[self.rear] = item
        return true
    end
end

-- returns item at top of stack, returns false if failed
function Stack:pop()
    if self:isEmpty() then 
        return false
    else
        local toReturn = self[self.rear]
        self[self.rear] = nil
        self.rear = self.rear - 1
        return toReturn
    end
end