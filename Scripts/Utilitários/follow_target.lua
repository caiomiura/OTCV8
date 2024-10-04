macro(1, "AttackFollow", "F2", function()
   if g_game.isOnline() and g_game.isAttacking() then
         g_game.setChaseMode(1)
   end
end)
