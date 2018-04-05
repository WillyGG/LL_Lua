require "Circular_Queue"
require "Deck"

-- pushes players to the queue in a random order
function populate_players_queue()
    local ordered_playes = {}
    local ind = 1
    for k,v in pairs(players) do
        ordered_playes[ind] = v.name
        ind = ind + 1
    end 
    local shuffled_players = shuffle_table(ordered_playes)
    for k,v in pairs(shuffled_players) do
        print("pushing: ", v)
        players_queue:push(v)
    end
end

players = {}
players_queue = nil

-- populate the players table
players["WillyG"] = {name="WillyG", hand=nil}
players["Maz"] = {name="Maz", hand=nil}
players["Deccy"] = {name="Deccy", hand=nil}

players_queue = Circular_Queue:new(#players)
populate_players_queue()
while not players_queue:isEmpty() do 
    local popped = players_queue:pop()
    print(popped)
end