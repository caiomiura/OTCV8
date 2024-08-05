macro(1000, "BOLINHA DO CAPETA", function()
    local targetEffectIDs = {1929, 1494, 1664, 1684} -- Lista de possíveis IDs de efeitos
    local validPositions = {} -- Lista de posições sem os efeitos
    local playerPos = player:getPosition()

    -- Função para verificar se um dos efeitos alvo está presente na lista de efeitos
    local function hasTargetEffect(effectList)
        for _, effect in ipairs(effectList) do
            for _, id in ipairs(targetEffectIDs) do
                if effect:getId() == id then
                    return true
                end
            end
        end
        return false
    end

    -- Verifica se a posição do jogador tem algum dos efeitos alvo
    local playerTile = g_map.getTile(playerPos)
    if playerTile and hasTargetEffect(playerTile:getEffects()) then
        -- Loop sobre uma área de 5x5 (25 sqm) centrada na posição do personagem
        for dx = -2, 2 do
            for dy = -2, 2 do
                local tilePos = {x = playerPos.x + dx, y = playerPos.y + dy, z = playerPos.z}
                local tile = g_map.getTile(tilePos)

                if tile and not hasTargetEffect(tile:getEffects()) then
                    -- Se o efeito alvo não estiver presente neste tile, adiciona sua posição à lista de posições válidas
                    table.insert(validPositions, tilePos)
                end
            end
        end

        -- Verifica se há posições válidas disponíveis
        if #validPositions > 0 then
            -- Seleciona uma posição aleatória dentre as posições válidas
            local randomIndex = math.random(1, #validPositions)
            local newPos = validPositions[randomIndex]

            -- Movimenta para a nova posição
            autoWalk(newPos, 100, {ignoreNonPathable = true})
        end
    end
end)
