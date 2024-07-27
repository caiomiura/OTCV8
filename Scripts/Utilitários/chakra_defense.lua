local macroName = 'Chakra Defense';
local macroDelay = 100;
local tabName = setDefaultTab('Main');

addTextEdit("Chakra Defense, defense kai", storage.mysticSpell or "Chakra Defense, defense kai", function(widget, text)
  storage.mysticSpell = text;
end, tabName);

mysticMacro = function()
    local selfHealth, selfMana = hppercent(), manapercent();
    local mystic = hasManaShield();
    if selfHealth <= 75 and selfMana >= 90 and not mystic then
        say(storage.mysticSpell:split(',')[1])
    elseif selfHealth >= 80 and selfMana <= 30 and mystic then
      say(storage.mysticSpell:split(',')[2])
    end
end

mysticFull = function()
  say(storage.mysticSpell:split(',')[1])
  delay(1000)
end

macro(macroDelay, macroName, mysticMacro, tabName);
macro(macroDelay, macroName .. " Full", mysticFull, tabName);