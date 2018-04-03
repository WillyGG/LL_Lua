require "Cards.Card"

local g_name = "Guard"
local g_desc = "Guess what another player has in their hand, if you are correct they are out. Cannot guess guard." 
local g_quant = 5
local g_value = 1

Guard = Card:new()

function Guard:new()
    local inst = Card:new(g_name, g_desc, g_quant, g_value)
    return inst
end