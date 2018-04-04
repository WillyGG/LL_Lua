Circular_Queue = {front = -1, rear = -1} -- 0 based index circ q
Circular_Queue.__index = Circular_Queue

function Circular_Queue:new(size)
    local self = setmetatable({}, Circular_Queue)
    self.size = size
    if size ~= nil then self.max_ind = size - 1
    else self.max_ind = nil end

    -- populate the table
    for i=0, self.max_ind do 
        self[i] = nil
    end
    return self
end

function Circular_Queue:isFull()
    noPopCond = self.front == 0 and self.rear == self.max_ind
    genCond = self.front == self.rear+1
    return noPopCond or genCond
end

function Circular_Queue:isEmpty()
    return (self.front == -1 and self.rear == -1)
end

function Circular_Queue:push(item)
    if self:isFull() == true then
        return false
    end
    if self:isEmpty() then
        self.front = self.front + 1
    end
    -- circling the rear pointer
    if self.rear == self.max_ind then
        self.rear = 0
    else 
        self.rear = self.rear + 1
    end
    self[self.rear] = item
    return true
end

function Circular_Queue:pop()
    if self:isEmpty() == true then
        return false
    end
    local toReturn = self[self.front]

    -- if queue is empty
    if self.front == self.rear then
        self.front = -1
        self.rear = -1
    -- circling front pointer
    elseif self.front == self.max_ind then
        self.front = 0
    else
        self.front = self.front + 1
    end
    return toReturn
end

function Circular_Queue:peek()
    return self[self.front]
end