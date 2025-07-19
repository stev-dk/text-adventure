local rooms = {
    entrance = {
        description = "You have entered the Entrance Hall of the Shrine",
        details = "Theres an old wizard standing in a dark corner of the room. Maybe he knows something?",
        exits = {
            north = "puzzle_room",
            west = "treasure_chamber"
        },
        player_can_enter = true,
        enter_condition = "",
        npc = "wizard",
        items = {
            "key",
            "axe"
        }
    },

    puzzle_room = {
        description = "You are in the puzzle room!",
        details = "A lot of puzzles. Maybe you could solve one.",
        exits = { south = "entrance" },
        player_can_enter = true,
        enter_condition = "",
        npc = false,
        items = {}
    },

    treasure_chamber = {
            description = "You are in the treasue chamber!",
        details = "Gold. So much gold!",
        exits = { south = "entrance" },
        player_can_enter = false,
        enter_condition = "You must pickup the key to enter the Treasue Chamber",
        npc = false,
        items = {}
    }
}

return rooms
