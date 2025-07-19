local rooms = require "rooms"

local game_data = {
    game_is_running = true,
    current_room = rooms.entrance -- Starting room
}

function game_data.clear_screen()
    if not os.execute("clear") then
        os.execute("cls")
    elseif not os.execute("cls") then
        for i = 1,25 do
            print("\n\n")
        end
    end
end

function game_data.start_game()
    game_data.clear_screen()
    -- ASCII art?
    print("Welcome to text-adventure.")
    print("This game will take you on an exciting jouney.")
    print("You have four move commands: N, S, E and W")
    print("Press enter to continue.")
    io.read()
end

function game_data.show_room_description()
    print(game_data.current_room.description)
end

function change_room(new_room)
    if new_room.player_can_enter then
        game_data.clear_screen()
        game_data.current_room = new_room
    else
        -- Player cannot enter yet.
        print(new_room.enter_condition)
    end
end

function game_data.handle_user_input()
    local input = io.read()
    if (input:lower() == "exit" or input:lower() == "quit") then
        game_data.game_is_running = false
        return
    end

    if game_data.current_room.exits[input] then
        change_room(rooms[game_data.current_room.exits[input]])
    else
        print("Invalid input")
    end
end

return game_data
