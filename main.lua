require "Circular_Queue"
require "Deck"
require "Hand"

players = {}
players_queue = nil
deck = nil
current_player = nil

function init_game() 
    deck:init()
    populate_players_queue()
    init_hands()
end


function get_next_player()
    current_player = players_queue:pop()
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

-- deal one card to every player in players table
function init_hands()
    for k,v in pairs(players) do
        v.Hand:add(deck:pop())
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
end

function love.draw()
end

function love.update(dt)

end

