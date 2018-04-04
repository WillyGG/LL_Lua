require "Circular_Queue"
require "Deck"
require "Hand"

players = {}
players_queue = nil
deck = nil

function init_game() 
    deck:init()
    populate_players_queue()
end

-- pushes players to the queue in a random order
function populate_players_queue()
    local ordered_playes = {}
    local ind = 1
    for k,v in pairs(players) do
        ordered_playes[ind] = v.name
        ind = ind + 1
    end 
    print(ordered_playes)
    local shuffled_players = shuffle_table(ordered_playes)
    for k,v in pairs(shuffled_players) do 
        players_queue:push(v)
    end
end

function love.load()
    -- populate the players table
    players["WillyG"] = {name="WillyG", hand=Hand:new()}
    players["Maz"] = {name="Maz", hand=Hand:new()}
    players["Deccy"] = {name="Deccy", hand=Hand:new()}

    deck = Deck:new()
    players_queue = Circular_Queue:new(#players)
    init_game()

    local i = 10
    while not players_queue:isEmpty() do 
        local popped = players_queue:pop()
        love.graphics.print(popped, i)
        i = i + 10
    end
    
end

function love.draw()
    
    
    love.graphics.print("YOOOO", 100)
end

function love.update()

end

