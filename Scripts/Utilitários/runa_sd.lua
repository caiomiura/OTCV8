local currentEnemy

macro(200, "Test Rune", function()
    local isAttacking = g_game.isAttacking()
    
    if isAttacking then
        local newEnemy = g_game.getAttackingCreature()
        
        if newEnemy ~= currentEnemy then
            currentEnemy = newEnemy
        end
        
        if currentEnemy then
            usewith(storage.atkItem, currentEnemy)
        end
    end
end)

addTextEdit("atkItem", storage.atkItem or "3155", function(widget, text)
    storage.atkItem = tonumber(text) or "3155"
end)
