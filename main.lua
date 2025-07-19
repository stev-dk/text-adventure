--[[
Text Adventure
--]]
local rooms = require "rooms"
local game_data = require "game_data"

game_data.start_game()

while game_data.game_is_running do
    game_data.show_room_description()
    game_data.handle_user_input()
end
