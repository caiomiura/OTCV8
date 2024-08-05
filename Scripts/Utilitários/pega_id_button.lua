hotkey("F11", "Items/Effects ID", function()
    local tile = getTileUnderCursor()
    if tile then
        for i, fx in ipairs(tile:getEffects()) do
            warn("fx: " .. fx:getId())
        end
        for i, fx in ipairs(tile:getItems()) do
            warn("item: " .. fx:getId())
        end
    end
end)
