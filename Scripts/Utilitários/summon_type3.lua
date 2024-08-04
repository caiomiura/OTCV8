macro(1, 'Summon', function()
    if summonTime and summonTime >= now then return end
    for _, creature in ipairs(getSpectators(true)) do
        if creature:isMonster() and creature:getName():lower() == summonName and creature:getHealthPercent() > 20 then
            summon = false
            summonTime = now + 60000
            return
        end
    end
    if summon then
        return say(summonMagia)
    else
        return say('kai')
    end
end)
