local rooms = require "rooms"
local npc_dialog = require "dialog"

local game_data = {
    game_is_running = true,
    current_room = rooms.entrance, -- Starting room
    inventory = {}
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
    print("You have five commands: go, look, talk, inventory and take")
    print("You can write stop during a dialog, to stop the dialog early.")
    print("Press enter to continue.")
    io.read()
end

function game_data.show_room_description()
    -- TODO, maybe only show the discription first time a user enters a room
    -- or, maybe at every third invalid input?
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
    local input = io.read():lower()

    -- Giving user the option to exit early
    if (input:lower() == "exit" or input:lower() == "quit") then
        game_data.game_is_running = false
        return
    end

    if input == "inventory" then
        if #game_data.inventory < 1 then
            print("Your inventory is empty")
        else
            io.write("Items in inventory: ")
            for i,v in ipairs(game_data.inventory) do
                io.write(v .. " ")
            end
            print("")
        end
        return
    end

    if input == "look" then
        io.write("You look around and see: ")
        print(game_data.current_room.details)
        return
    end

    -- TODO: make upgrade to accept go west, go east ect...
    if input == "go" then
        io.write("Where to you want to go: ")
        local location = io.read():lower()
        if game_data.current_room.exits[location] then
            change_room(rooms[game_data.current_room.exits[location]])
            return
        else
            print("Invalid location")
            return
        end
    end

    if input == "talk" then
        if game_data.current_room.npc then
            io.write("Who do you want to talk to: ")
            local talk_to = io.read():lower()
            if talk_to == game_data.current_room.npc then
                -- Dialog loop
                local status = coroutine.status(npc_dialog[talk_to].dialog)

                if status == "dead" then
                    print(npc_dialog[talk_to].last_sentance)
                    return
                end

                while status ~= "dead" do
                    coroutine.resume(npc_dialog[talk_to].dialog)
                    status = coroutine.status(npc_dialog[talk_to].dialog)
                    io.write("...")
                    local continue = io.read():lower()
                    if continue == "stop" then break end -- End dialog early
                end
                return
            else
                print(talk_to .. " is not in this room.")
                return
            end
        else
            print("There is no one to talk to in this area.")
        end
        return
    end

    if input == "take" then
        if #game_data.current_room.items < 1 then
            print("There is no items to pick up in this room.")
        else
            io.write("What item to you want to take: ")
            local item = io.read():lower()

            for i,v in ipairs(game_data.current_room.items) do
                if item == v then
                    table.remove(game_data.current_room.items, i)
                    game_data.current_room.on_pickup()
                    table.insert(game_data.inventory, item)
                    rooms[game_data.current_room.unlock_room].player_can_enter = true
                    return
                end
            end
            print("There is no " .. item .. " in this room.")
        end
        return
    end

    -- Catching everything else...
    print("Invalid input")
end

return game_data
