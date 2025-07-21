local guard_dialog = coroutine.create(function()
    print("I am the guardian of the treasure chamber!")
    print("I will not step aside!")
    coroutine.yield()
    print("Unless...")
    print("I you find me my lost [something funny]")
    coroutine.yield()
    print("I will consider. Now be gone!")
end)

local wizard_dialog = coroutine.create(function()
    print("I am the old wizard")
    print("I will not step aside!")
    coroutine.yield()
    print("Unless...")
    print("I you find me my lost [something funny]")
    coroutine.yield()
    print("I will consider. Now be gone!")
end)

local npc_dialog = {
    ["guard"] = {
        dialog = guard_dialog,
        last_sentance = "Find me my [something funny]."
    },
    ["wizard"] = {
        dialog = wizard_dialog,
        last_sentance = "Just do it."
    }
}

return npc_dialog
