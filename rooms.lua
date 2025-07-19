local rooms = {
    entrance = {
        description = "You have entered the Entrance Hall of the Shrine",
        exits = { north = "puzzle_room" },
        player_can_enter = true
    },

    puzzle_room = {
        description = "You are in th puzzle room!",
        exits = { south = "entrance" },
        player_can_enter = false,
        enter_condition = "You must pickup the key to enter the Puzzle Room"
    },

    treasure_chamber = { ... }
}

return rooms
