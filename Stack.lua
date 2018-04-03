Stack = {rear = -1}

-- constructor - initialise stack at passed size
function Stack:new(size)
    setmetatable({}, Stack)

    self.size = size
    self.max_ind = size-1
    for i=0, self.max_ind, 1 do 
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
    if self:isFull() then 
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

function testFunction() 
    return 1
end