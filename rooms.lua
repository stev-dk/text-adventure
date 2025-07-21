local rooms = {
    entrance = {
        description = "You have entered the Entrance Hall of the Shrine",
        details = "Theres an opening to the north. Theres a guard standing to the west.",
        exits = {
            north = "puzzle_room",
            west = "treasure_chamber"
        },
        player_can_enter = true,
        enter_condition = "",
        npc = "guard",
        items = {}
    },

    treasure_chamber = {
            description = "You are in the treasue chamber!",
        details = "Gold. So much gold!",
        exits = { south = "entrance" },
        player_can_enter = false,
        enter_condition = "You must get past the guard to enter the Treasue Chamber",
        npc = false,
        items = {}
    },

    puzzle_room = {
        description = "You have entered a mysterious puzzle room!",
        details = "A lot of puzzles. Maybe you could solve one.",
        exits = { south = "entrance" },
        player_can_enter = true,
        enter_condition = "",
        npc = "wizard",
        items = { "scarab" }, -- create a riddle for this... could be synonym to what the guard is missing.
        on_pickup = function()
            print("You find it! You actually found it!.")
        end,
        unlock_room = "treasure_chamber"
    }
}

return rooms
