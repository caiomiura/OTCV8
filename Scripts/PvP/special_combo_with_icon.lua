stairMacro =
macro(1, "ESPECIAL", "x", function()
 if g_game.isAttacking() then
 say('NOME_ESPECIAL')
end 
end)
addIcon("NOME_ESPECIAL", {item = 2145, text = "NOME_ESPECIAL"}, stairMacro)

UI.Separator()