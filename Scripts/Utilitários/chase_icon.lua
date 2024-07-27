macro(50,function()
    if g_game.getChaseMode() == 1 then
        chaseIcon.text:setColoredText({"Chase\n","white","On","green"})
    else
        chaseIcon.text:setColoredText({"Chase\n","white","OFF","red"})
    end
end);