require "Circular_Queue"
require "Deck"
require "Hand"

function init_game() 
    deck:init()
    populate_players_queue()
    init_hands()
    update_and_draw()   
end

-- pushes players to the queue in a random order
function populate_players_queue()
    local ordered_playes = {}
    local ind = 1
    for k,v in pairs(players) do
        ordered_playes[ind] = v
        ind = ind + 1
    end 
    local shuffled_players = shuffle_table(ordered_playes)
    for k,v in pairs(shuffled_players) do 
        players_queue:push(v)
    end
end

-- deal one card to every player in players table
function init_hands()
    for k,v in pairs(players) do
        local card = deck:pop()
        v.hand:add( card )  
    end
end

function end_game()

end

function update_and_draw() 
    current_player = players_queue:pop()
    local next_card = deck:pop()
    current_player.hand:add(next_card)
end

function populate_players()
    -- populate the players table
    players["WillyG"] = {name="WillyG", hand=Hand:new(), out=false}
    players["Maz"] = {name="Maz", hand=Hand:new(), out=false}
    players["Deccy"] = {name="Deccy", hand=Hand:new(), out=false}
end

function draw_players_in()
    local i = 0
    local X_CONST = 400
    love.graphics.print("Players in:", X_CONST)
    for k,v in pairs(players) do
        if v.out == false then
            local y = i * 50 + 15
            love.graphics.print(v.name, X_CONST, y)
            i = i + 1
        end 
    end
end

function show_next_player()
    local X_CONST = 500
    local next_player_name = players_queue:peek().name
    love.graphics.print("Next Player:\n"..next_player_name, X_CONST)
end

function love.load()
    players = {}
    players_queue = nil
    deck = Deck:new()
    current_player = nil
    next_turn = false
    
    populate_players()
    players_queue = Circular_Queue:new(#players)
    init_game() 
end

function love.draw()
    love.graphics.print(current_player.name)
    current_player.hand:draw_hand()
    draw_players_in()
    show_next_player()
end

function love.update(dt)

end