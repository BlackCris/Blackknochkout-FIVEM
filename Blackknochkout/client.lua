local isAntiKnockoutEnabled = true

-- Combined anti-knockout thread with optimized wait time
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(100) -- Increased wait time to 1 second
        if not isAntiKnockoutEnabled then return end
        
        local playerPed = PlayerPedId()
        
        -- Disable stealth movement
        if GetPedStealthMovement(playerPed) then
            SetPedStealthMovement(playerPed, false)
        end
        
        -- Disable ragdoll and knockout flags
        SetPedCanRagdoll(playerPed, false)
        SetPedConfigFlag(playerPed, 32, false)
        SetPedCanBeKnockedOffVehicle(playerPed, false)
        
        -- If ragdolled, recover immediately
        if IsPedRagdoll(playerPed) then
            ClearPedTasksImmediately(playerPed)
            SetPedToRagdoll(playerPed, 1, 1, 0, false, false, false)
        end
    end
end)

-- Block knockout events (only need to register once)
RegisterNetEvent('knockout:client', function() end)
RegisterNetEvent('esx_knockout:knockout', function() end)

