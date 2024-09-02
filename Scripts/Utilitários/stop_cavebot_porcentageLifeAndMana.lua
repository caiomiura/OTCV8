local mnparar = 20 -- porcentagem de mana que vai desativar
local mnvoltar = 80 -- porcentagem de mana que vai ativar
local hpparar = 30 -- porcentagem de vida que vai desativar
local hpvoltar = 90 -- porcentagem de vida que vai ativar

macro(10, "Stop cavebot % mana e vida", function()
    local manaPercent = manapercent()
    local hpPercent = hppercent()

    if (manaPercent <= mnparar or hpPercent <= hpparar) and CaveBot.isOn() then
        CaveBot.setOff()
    elseif (manaPercent >= mnvoltar and hpPercent >= hpvoltar) and not CaveBot.isOn() then
        CaveBot.setOn()
    end
end)
