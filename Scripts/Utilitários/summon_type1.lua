addLabel("","Summon Cfg"):setColor("yellow")
addLabel("","Spell, Qtd, Nome")
addTextEdit("", storage.summonConfig or "Spell,3,Nome", function(widget, text)
    storage.summonConfig = text;
end)

macro(100, 'Summon', function()
    if isInPz() then return end
    
    local summonSetup = storage.summonConfig:split(",");
    local summonSpell = summonSetup[1]
    local summonQty = tonumber(summonSetup[2])
    local summonName = summonSetup[3]:lower():trim()

    local summonCount = 0;
    for _, creature in ipairs(getSpectators(posz())) do
        if creature:isMonster() and creature:getName():lower() == summonName then
            summonCount = summonCount + 1;
        end
    end
    if summonCount < summonQty then
        say(summonSpell)
    end
end)