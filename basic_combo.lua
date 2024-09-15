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

local macroName = 'MW Cursor';
local macroDelay = 100;
local tabName = setDefaultTab('Main');

UI.Label('MW Key R', tabName)
itemWidget = [[
Panel
  height: 34
  margin-top: 7
  margin-left: 25
  margin-right: 25

  UIWidget
    id: text
    anchors.left: parent.left
    anchors.verticalCenter: next.verticalCenter

  BotItem
    id: item
    anchors.top: parent.top
    anchors.right: parent.right
]]

storage.itemValues = storage.itemValues or {};
addItem = function(id, title, defaultItem, dest, tooltip)
    local widget = setupUI(itemWidget, dest)
    widget.text:setText(title)
    widget.text:setTooltip(tooltip)
    widget.item:setTooltip(tooltip)
    widget.item:setItemId(storage.itemValues[id] or defaultItem)
    widget.item.onItemChange = function(widget)
        storage.itemValues[id] = widget:getItemId()
    end
    storage.itemValues[id] = storage.itemValues[id] or defaultItem
end


addItem('mwallId', 'MW ID', 110, tabName, '');

hotkey('R', macroName, function()
    local tile = getTileUnderCursor();
    if (modules.game_console:isChatEnabled() or modules.corelib.g_keyboard.isCtrlPressed()) then return; end
    if not tile then return end
    g_game.stop();
    player:stopAutoWalk();
    useWith(storage.itemValues.mwallId, tile:getTopUseThing())
    delay(macroDelay)
end, tabName);
