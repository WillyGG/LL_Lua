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
    love.graphics.setColor(255,255,255)
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
    love.graphics.setColor(255,255,255)
    love.graphics.print("Next Player:\n"..next_player_name, X_CONST)
end

-- returns the clicked card if a card has been clicked, otherwise returns nil
function get_clicked_card()
    local i = 1
    local picked = false
    -- REDO THIS ENTIRE LOOP SECTION
    while i <= current_player.hand.MAX_CARDS and not picked do
        local card = current_player.hand[i]
        local clicked_card = nil
        if card ~= nil then
            if card:isClicked() then
                clicked_card = current_player.hand:pop_card(card.name)
                picked = true
            end
        end
        i = i + 1
    end
    return picked
end

function love.load()
    players = {}
    players_queue = nil
    deck = Deck:new()
    current_player = nil
    next_turn = false
    mouse_released = true

    populate_players()
    players_queue = Circular_Queue:new(#players)
    init_game()
end

-- error when cards clicked too many times (probs just fill in the rest of the game logic)
function love.draw()
    love.graphics.print(current_player.name)
    current_player.hand:draw_hand()
    draw_players_in()
    show_next_player()
    if love.mouse.isDown(1) and mouse_released then
        picked = get_clicked_card()
        if picked ~= nil then
            -- process card effect

            -- determine if game over

            -- if not, change turns
            players_queue:push(current_player)
            update_and_draw()
        end
        mouse_released = false
    end
end

function love.update(dt)

end

function love.mousereleased(x, y, button)
    if button == 1 then
        mouse_released = true
    end
end
