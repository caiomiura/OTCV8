macro(200, "Use SD Rune", function()
    if g_game.isAttacking() then
        currentEnemy = g_game.getAttackingCreature()
    end
    if currentEnemy and g_game.isAttacking(currentEnemy) then
        usewith(storage.atkItem, currentEnemy)
    end
end)

addTextEdit("atkItem", storage.atkItem or "3155", function(widget, text)
    storage.atkItem = tonumber(text) or "3155"
end)
