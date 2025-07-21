local guard_dialog = coroutine.create(function()
    print("[Guard] I am the guardian of the treasure chamber!")
    print("[Guard] I will not step aside!")
    coroutine.yield()
    print("[Guard] Unless...")
    print("[Guard] I you find me my lost [something funny]")
    coroutine.yield()
    print("[Guard] I will consider. Now be gone!")
end)

local wizard_dialog = coroutine.create(function()
    print("[Wizard] I am the old wizard")
    print("[Wizard] I will not step aside!")
    coroutine.yield()
    print("[Wizard] Unless...")
    print("[Wizard] I you find me my lost [something funny]")
    coroutine.yield()
    print("[Wizard] I will consider. Now be gone!")
end)

local npc_dialog = {
    ["guard"] = {
        dialog = guard_dialog,
        last_sentance = "[Guard] Please find me my [something funny]."
    },
    ["wizard"] = {
        dialog = wizard_dialog,
        last_sentance = "[Wizard] Just do it."
    }
}

return npc_dialog
