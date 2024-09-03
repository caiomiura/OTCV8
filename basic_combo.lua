onCreatureHealthPercentChange(function(creature, hpPercent)
    creature:setText(hpPercent .. '%')
end);

UI.Separator ()

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

UI.Separator ()

UI.Label("-- Treino --"):setColor('pink')

macro(100, "Treino ML", function()
  if manapercent() > 90 then
       say('Chakra Down')
     else
        say('Chakra Regen')
  end
end)

UI.Separator ()
