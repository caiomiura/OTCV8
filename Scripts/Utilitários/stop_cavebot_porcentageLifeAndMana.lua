local mnparar = 20 -- porcentagem de mana que vai desativar
local mnvoltar = 80 -- porcentagem de mana que vai ativar
local hpparar = 30 -- porcentagem de vida que vai desativar
local hpvoltar = 90 -- porcentagem de vida que vai ativar

macro(10, "Stop cavebot % mana e vida", function()
     if (manapercent() <= mnparar or hppercent() <= hpparar) then
        CaveBot.setOff()
    elseif (manapercent() >= mnvoltar and hppercent() >= hpvoltar) then
        CaveBot.setOn()
    end
end)
