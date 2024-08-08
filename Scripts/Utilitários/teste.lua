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



local pvpIcon = addIcon("pvpIcon",{text="Chase", switchable=false, moveable= true}, function()
    if g_game.isSafeFight() then
        g_game.setSafeFight()
    else
      g_game.setSafeFight(1)
    end
end);
pvpIcon:setSize({height=30,width=50});
pvpIcon.text:setFont('verdana-11px-rounded');

macro(50,function()
    if g_game.isSafeFight() then
        pvpIcon.text:setColoredText({"PVP\n","white","OFF","red"})
    else
        pvpIcon.text:setColoredText({"PVP\n","white","ON","green"})
    end
end);



local chaseIcon = addIcon("chaseIcon",{text="Chase",switchable=false,moveable=true}, function()
    if g_game.getChaseMode() == 1 then
        g_game.setChaseMode(0)
    else
        g_game.setChaseMode(1)
    end
end);
chaseIcon:setSize({height=30,width=50})
chaseIcon.text:setFont('verdana-11px-rounded')


macro(50,function()
    if g_game.getChaseMode() == 1 then
        chaseIcon.text:setColoredText({"Chase\n","white","On","green"})
    else
        chaseIcon.text:setColoredText({"Chase\n","white","OFF","red"})
    end
end);
